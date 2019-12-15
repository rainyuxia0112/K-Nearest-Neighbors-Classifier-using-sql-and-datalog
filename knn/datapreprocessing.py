#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Dec 14 18:33:50 2019

@author: rain
"""
import requests
from bs4 import BeautifulSoup as bs
from urllib import request

def get_data(url, name): 
    """
    url - website
    name - csv name
    """
    rq = request.urlopen(url)
    res = rq.read()
    
    # Save the string to a file
    csvstr = str(res).strip("b'")
    
    lines = csvstr.split("\\n")
    f = open("data.csv", "w")
    for line in lines:
       f.write(line + "\n")
    f.close()
    
    import pandas as pd
    knn = pd.read_csv('data.csv')
    knn.iloc[:, -1] = knn.iloc[:, -1].map(lambda x: int(x[0]))
    data = knn.iloc[:, :2]
    data_label =  knn.iloc[:, -1]
    data_label = data_label.rename("label")
    data = pd.concat([data, data_label], axis = 1)  
    data.to_csv(name+'.csv', header=False)
    

if __name__ == '__main__':
    urls = ['http://archive.ics.uci.edu/ml/machine-learning-databases/hill-valley/Hill_Valley_without_noise_Testing.data', 
            'http://archive.ics.uci.edu/ml/machine-learning-databases/hill-valley/Hill_Valley_without_noise_Training.data']
    names = ['arc', 'rc1']
    for url, name in zip(urls, names):
        get_data(url, name)
        