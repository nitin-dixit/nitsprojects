#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import dash
import dash_core_components as dcc
import dash_html_components as html
from dash.dependencies import Input, Output, State
from dash.exceptions import PreventUpdate
import numpy as np 
import pandas as pd
from scipy.cluster.vq import kmeans, vq
#from sklearn.cluster import KMeans
from sklearn import neighbors
from sklearn.preprocessing import MinMaxScaler
import plotly.graph_objs as go
import warnings
warnings.filterwarnings("ignore")

df=pd.read_csv('books.csv', error_bad_lines=False)
print('Size of data frame is :',df.shape)
df.index=df['bookID']

most_books = df.groupby('authors')['title'].count().reset_index().sort_values('title', ascending=False).head(30).set_index('authors')
most_rated = df.sort_values('ratings_count', ascending = False).head(30).set_index('title')
booksPerRating=df['average_rating'].value_counts().iloc[:30]
booksPerRating.to_frame()
booksWithMorePages = df.sort_values('# num_pages', ascending = False).head(30).set_index('title')
TopBooksReviews = df.sort_values('text_reviews_count', ascending = False).head(30).set_index('title')

'''
Topic Modelling
KMeans Clustering without outliers

KMeans clustering is a type of unsupervised learning which groups unlabelled data. The goal is to find groups in data.
With this, we attepmt to find a relationship or groups between the rating count and average rating value.
'''
trial = df[['average_rating', 'ratings_count']]
data = np.asarray([np.asarray(trial['average_rating']), np.asarray(trial['ratings_count'])]).T

#we'll use the Elbow Curve method for the best way of finding the number of clusters for the data
#From the elbow plot, we get that the elbow lies around the value K=5, so that's what we will attempt it with
#Computing K means with K = 5, thus, taking it as 5 clusters
centroids, _ = kmeans(data, 5)

#assigning each sample to a cluster
#Vector Quantisation:

#idx, _ = vq(data, centroids)


'''
From the above plot, now we can see that once the whole system can be classified into clusters. As the count increases, the rating would end up near the cluster given above. The green squares are the centroids for the given clusters.

As the rating count seems to decrease, the average rating seems to become sparser, with higher volatility and less accuracy.

Recommendation Engine
Having seen the clustering, we can infer that there can be some recommendations which can happen with the relation between Average Rating and Ratings Count.

Taking the Ratings_Distribution (A self created classifying trend), the recommendation system works with the algortihm of K Nearest Neighbors.

Based on a book entered by the user, the nearest neighbours to it would be classified as the books which the user might like.

KNN is used for both classification and regression problems. In classification problems to predict the label of a instance we first find k closest instances to the given one based on the distance metric and based on the majority voting scheme or weighted majority voting(neighbors which are closer are weighted higher) we predict the labels.



In a setting such as this, the unsupervised learning takes place, with the similar neighbors being recommended. For the given list, if I ask recommendations for "The Catcher in the Rye", five books related to it would appear.

Creating a books features table, based on the Ratings Distribution, which classifies the books into ratings scale such as:

Between 0 and 1
Between 1 and 2
Between 2 and 3
Between 3 and 4
Between 4 and 5
Broadly, the recommendations then consider the average ratings and ratings cout for the query entered.
'''
def segregation(data):
    values = []
    for val in data.average_rating:
        if val>=0 and val<=1:
            values.append("Between 0 and 1")
        elif val>1 and val<=2:
            values.append("Between 1 and 2")
        elif val>2 and val<=3:
            values.append("Between 2 and 3")
        elif val>3 and val<=4:
            values.append("Between 3 and 4")
        elif val>4 and val<=5:
            values.append("Between 4 and 5")
        else:
            values.append("NaN")
    return values
df['Ratings_Dist'] = segregation(df)
books_features = pd.concat([df['Ratings_Dist'].str.get_dummies(sep=","), df['average_rating'], df['ratings_count']], axis=1)
'''
The min-max scaler is used to reduce the bias which would have been present due to some books having a 
massive amount of features, yet the rest having less. 
Min-Max scaler would find the median for them all and equalize it.
'''
min_max_scaler = MinMaxScaler()
books_features = min_max_scaler.fit_transform(books_features)                                    
model = neighbors.NearestNeighbors(n_neighbors=6, algorithm='ball_tree',metric='euclidean')

model.fit(books_features)
distance, indices = model.kneighbors(books_features)
'''
Creating specific functions to help in finding the book names:

Get index from Title
Get ID from partial name (Because not everyone can remember all the names)
Print the similar books from the feature dataset. (This uses the Indices metric from the nearest neighbors to pick the books.)

'''

similarBooks=list()
partialNameId=list()

def get_index_from_name(name):
    return df[df["title"]==name].index.tolist()[0]

all_books_names = list(df.title.values)

def get_id_from_partial_name(partial):
    partialNameId=[]
    for name in all_books_names:
        if partial in name:
                partialNameId.append(name+str(all_books_names.index(name)))
    return partialNameId
            
def print_similar_books(query=None,id=None):
    similarBooks=[]
    if id:
        for id in indices[id][1:]:
            similarBooks.append(df.iloc[id]["title"])
        return similarBooks
    if query:
        found_id = get_index_from_name(query)
        for id in indices[found_id][1:]:
            similarBooks.append(df.iloc[id]["title"])
        return similarBooks


'''
Checking out the Workings of the System, let's try with following examples.

System by name: The Catcher in the Rye
System by Name: The Hobbit
System by partial name: Harry Potter (Book 5)
'''
#The Catcher in the Rye:
#print_similar_books("The Catcher in the Rye")
#The Hobbit or There and Back Again:
#print_similar_books("The Hobbit or There and Back Again")
#Harry Potter Book 5:
#print(get_id_from_partial_name("Harry Potter and the "))
#print_similar_books(id = 1) #ID for the Book 5
########################### html with dash ###############################################################################################
external_stylesheets = ['https://codepen.io/chriddyp/pen/bWLwgP.css']

app = dash.Dash(__name__, external_stylesheets=external_stylesheets)

colors = {
    'background': '#111111',
    'text': '#7FDBFF'
}
app.layout = html.Div(
        style={
                'backgroundColor': colors['background']
              }, 
        children=[
                    html.H1(
                            children=html.P(html.A( 'Goodreads: Books analysis & similar books recommendation')),
                            style={
                                    'textAlign': 'center',
                                    'margin-bottom':'50px',
                                    'font-size':'5px',
                                    'color': '#47b9e6',
                                    'font-family': 'Iceland'
                                    
                                  }
                            ),
   
                    html.Div(
        [
            html.Div(
                [
                    html.H6("""Select analysis to see the visualization :""",
                            style={'margin-right': '1em',
                                   'color': colors['text'],
                                   'margin-left': '1em'
                                   })
                ],
            ),

            dcc.Dropdown(
                id='dropdown',
                options=[
                        
                    {'label': 'Top 30 authors with most books', 'value': 'topauthors'},
                    {'label': 'Distribution of books for all languages', 'value': 'bookLanguageDist'},
                    {'label': 'Average Rating Distribution', 'value': 'averageRatingDist'},
                    {'label': 'Top 30 most rated books', 'value': 'topbooks'},
                    {'label': 'Number of books per rating', 'value': 'booksPerRating'},
                    {'label': 'Top 30 books with more pages', 'value': 'booksWithMorePages'},
                    {'label': 'Top 30 books with more written text reviews', 'value': 'TopBooksReviews'},
                    {'label': 'Relationship between Rating and Text Reviews', 'value': 'ratingTextRelation'},
                    {'label': 'Relationship between Rating and Number of pages', 'value': 'ratingPagesRelation'}
                ],
                value='topauthors',
                placeholder="Select any analysis",
                style=dict(
                    width='70%',
                    verticalAlign="middle"
                )
            )
        ],
        style=dict(display='flex')
    ),

    dcc.Graph(id='graph'),
   html.Br(),
    html.Div(
        [
            html.Div(
                [
                    html.H6("Enter any book name: ",
                            style={'margin-right': '1em',
                                   'color': colors['text'],
                                    'margin-left': '1em'
                                   })
                ],
            ),
                html.Div([
    dcc.Input(id='input-1-state', type='text', value="",placeholder='Enter book name'),
    dcc.Input(id='input-2-state', type='number', min=1, value="" ,placeholder='Enter by Book_Id',style={'margin-left': '1em'}),
    html.Button('Submit',id='submit_button', n_clicks=0, type="submit",
                style={'margin-left': '1em',
                       'color': '#ffffff'}
                ),
                html.Button('Reset',id='reset_button', n_clicks=0,
                            style={'margin-left': '1em',
                                   'color': '#ffffff'}),
   
    ])
        ],
        style=dict(display='flex')
    ),
    html.Br(),
    html.Div(
             html.Div(id='output-state',
             style={'color': '#ffffff',
                     'text': '#ffffff'}
                     )
            ),
    dcc.Textarea(
                id='textarea',
                placeholder='List of recommended books based on input...',
                value='',
                style={'width': '70%'}
)  

])

@app.callback(
        Output('graph','figure'),
        [Input('dropdown','value')],
        )


    
def update_graph(dropdown_value):
    if(dropdown_value=='topauthors'):
        return{
                'data':[go.Bar(x=most_books.index, y=most_books['title'],marker_color='#3b9bdb' )],
                'layout':go.Layout(
                        xaxis={'title': 'Authors',},
                        yaxis={'title': 'Books_Count'},
                        plot_bgcolor=colors['background'],
                        paper_bgcolor= colors['background'],
                        font= {
                    'color': colors['text']
                                }
                        )
                }
    elif(dropdown_value=='' or dropdown_value== None):
        return{
                'data':[go.Bar(x=most_books.index, y=most_books['title'], )],
                'layout':go.Layout(
                        xaxis={'title': 'Authors',},
                        yaxis={'title': 'Books_Count'},
                        plot_bgcolor=colors['background'],
                        paper_bgcolor= colors['background'],
                        font= {
                    'color': colors['text']
                                }
                        )
                }
    elif(dropdown_value=='bookLanguageDist'):
        return{
                'data':[go.Bar(x=df.groupby('language_code')['title'].count().index, y=df.groupby('language_code')['title'].count(), marker_color='#CC2529' )],
                'layout':go.Layout(
                        xaxis={'title': 'Languages',},
                        yaxis={'title': 'Count'},
                        plot_bgcolor=colors['background'],
                        paper_bgcolor= colors['background'],
                        font= {
                    'color': colors['text']
                                }
                        )
                }
    elif(dropdown_value=='averageRatingDist'):
        return{
                'data':[go.Histogram(x=df['average_rating'],
                                     histnorm='probability',
                                     name='control', # name used in legend and hover labels
                                     marker_color='#8A2BE2',
                                     opacity=0.75)],
                'layout':go.Layout(
                        xaxis={'title': 'average_rating'},
                        plot_bgcolor=colors['background'],
                        paper_bgcolor= colors['background'],
                        font= {
                    'color': colors['text']
                                }
                        )
                }
    elif(dropdown_value=='topbooks'):
        return{
                'data':[go.Bar(x=most_rated.index, y=most_rated['ratings_count'], marker_color='#ff6c03' )],
                'layout':go.Layout(
                        xaxis={'title': 'Title',},
                        yaxis={'title': 'Ratings_Count'},
                        plot_bgcolor=colors['background'],
                        paper_bgcolor= colors['background'],
                        font= {
                                'color': colors['text']
                                }
                        )
                }
    elif(dropdown_value=='booksPerRating'):
        return{
                
                'data':[go.Bar(x=booksPerRating.iloc[:30] , y=booksPerRating.iloc[:30], marker_color='#CC2529' )],
                'layout':go.Layout(
                        xaxis={'title': 'Book_Count',},
                        yaxis={'title': 'Average_Rating'},
                        plot_bgcolor=colors['background'],
                        paper_bgcolor= colors['background'],
                        font= {
                                'color': colors['text']
                                }
                        )
                }
    elif(dropdown_value=='booksWithMorePages'):
        return{
                
                'data':[go.Bar(x=booksWithMorePages.index , y=booksWithMorePages['# num_pages'],marker_color='#008080' )],
                'layout':go.Layout(
                        xaxis={'title': 'Book_Title',},
                        yaxis={'title': 'Page_Count'},
                        plot_bgcolor=colors['background'],
                        paper_bgcolor= colors['background'],
                        font= {
                                'color': colors['text']
                                }
                        )
                }
    elif(dropdown_value=='TopBooksReviews'):
        return{
                
                'data':[go.Bar(x=TopBooksReviews.index , y=TopBooksReviews['text_reviews_count'], marker_color='#009476' )],
                'layout':go.Layout(
                        xaxis={'title': 'Book_Title',},
                        yaxis={'title': 'Reviews_Count'},
                         plot_bgcolor=colors['background'],
                        paper_bgcolor= colors['background'],
                        font= {
                                'color': colors['text']
                                }
                        )
                }
    elif(dropdown_value=='ratingTextRelation'):
        
        data= df[['text_reviews_count', 'average_rating']]
        return{
                
                'data': [go.Scatter(
            x=data['average_rating'],
            y=data['text_reviews_count'],
            mode='markers',
            marker={
                'size': 15,
                'opacity': 0.5,
                'line': {'width': 0.5, 'color': 'white'}
            },
            marker_color='#008B8B'
        )],
                'layout': go.Layout(
                        xaxis={'type': 'log', 'title': 'average_rating'},
                        yaxis={'title': 'text_reviews_count'},
                        margin={'l': 40, 'b': 40, 't': 10, 'r': 10},
                        legend={'x': 0, 'y': 1},
                        hovermode='closest',
                        
                        plot_bgcolor=colors['background'],
                        paper_bgcolor= colors['background'],
                        font= {
                                'color': colors['text']
                                }
                        
                        )   
                }
    elif(dropdown_value=='ratingPagesRelation'):
        
        data= df[['average_rating', '# num_pages']]
        return{
                
                'data': [go.Scatter(
            x=data['average_rating'],
            y=data['# num_pages'],
            mode='markers',
            marker={
                'size': 15,
                'opacity': 0.5,
                'line': {'width': 0.5, 'color': 'white'}
            },
            marker_color='#ff0033'
        )],
                'layout': go.Layout(
                        xaxis={'type': 'log', 'title': 'average_rating'},
                        yaxis={'title': 'No_of_pages'},
                        margin={'l': 40, 'b': 40, 't': 10, 'r': 10},
                        legend={'x': 0, 'y': 1},
                        hovermode='closest',
                        
                        plot_bgcolor=colors['background'],
                        paper_bgcolor= colors['background'],
                        font= {
                                'color': colors['text']
                                }
                        
                        )   
                }

@app.callback(Output('textarea','value'),
        [Input('submit_button','n_clicks'),], 
         #Input('reset_button','n_clicks')],
        [State('input-1-state', 'value'),
         State('input-2-state', 'value')
        ]
        )
def update_output(submitbtn, value1,value2):
    if submitbtn is None:
        raise PreventUpdate
    else:
        if(value1!=''):
            try:
                return ',\n'.join(map(str,print_similar_books(value1)))
            except IndexError:
                return ',\n'.join(map(str,get_id_from_partial_name(value1)))
        elif(value1=='' and value2!=''):
            return ',\n'.join(map(str,list(print_similar_books(id=value2))))
        elif(value1=='' and value2==''):
            return str('')
                
@app.callback([Output('input-1-state','value'),
               Output('input-2-state','value')],
             [Input('reset_button','n_clicks')])
def update(n_clicks):
    if n_clicks is None:
        raise PreventUpdate
    else:
        return ['','']

if __name__ == '__main__':
    app.run_server(debug=True)
