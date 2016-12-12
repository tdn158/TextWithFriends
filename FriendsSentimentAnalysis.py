#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Wed Nov 30 12:18:15 2016

@author: terrenceneumann
"""

#%% Build list of links to Friends scripts 
import urllib2
from bs4 import BeautifulSoup

scripts = 'http://www.livesinabox.com/friends/scripts.shtml'
page = urllib2.urlopen(scripts)
soup = BeautifulSoup(page)

right_table = soup.findAll('table')[4]

links = []
#-- extract only friends episodes from list of links
for row in range(41, len(right_table.find_all('a')) - 3):
    links.append(right_table.find_all('a')[row]['href'])
    
    
#%% Scrape Scripts, Create Dictionary, Seperate Out by Character

import re

# remove html from scraped text
tag_re = re.compile(r'<[^>]+>')

def remove_tags(text):
    return tag_re.sub('', text).replace('\n', ' ').replace('\xc2', ' ')\
    .replace('\xa0', ' ').replace('\x92', ' ').replace('\x85', ' ').lower()

# Store the scripts from the links
FriendsDict = {}
for episode in range(len(links)):
    tmpLink = 'http://www.livesinabox.com/friends/' + links[episode]
    page = urllib2.urlopen(tmpLink)
    soup = BeautifulSoup(page)
    tmpText = soup.find_all('p')
    if len(tmpText) > 20:
        FriendsDict[episode] = {}
        for line in range(len(tmpText)):
            if len(remove_tags(str(tmpText[line])).split(r':')) == 2:
                FriendsDict[episode][line] = {}
                character = remove_tags(str(tmpText[line])).split(r':')[0]
                text = remove_tags(str(tmpText[line])).split(r':')[1]
                FriendsDict[episode][line] = {'character': character, 'text': text}    
  
episode_name = []
season = []
for episode in FriendsDict:
    if len(FriendsDict[episode]) > 20:
        if len(links[episode].split('.')[0].split('/')) == 2:
            season.append(links[episode].split('.')[0].split('/')[0])
            episode_name.append(links[episode].split('.')[0].split('/')[1])
        elif len(links[episode].split('.')[0].split('/')) == 1:
            season.append('season' + links[episode].split('.')[0][:2])
            episode_name.append(links[episode].split('.')[0][2:])


#%% --- Seperate into lines for the six main characters, by show

monica = []
chandler = []
joey = []
rachel = []
phoebe = []
ross = []

for episode in FriendsDict:
    monicaLines = []
    chandlerLines = []
    joeyLines = []
    rachelLines = []
    phoebeLines = []
    rossLines = []
    
    for line in FriendsDict[episode]:
        if FriendsDict[episode][line]['character'] == 'monica':
            monicaLines.append(FriendsDict[episode][line]['text'])
        elif FriendsDict[episode][line]['character'] == 'chandler':
            chandlerLines.append(FriendsDict[episode][line]['text'])
        elif FriendsDict[episode][line]['character'] == 'joey':
            joeyLines.append(FriendsDict[episode][line]['text'])
        elif FriendsDict[episode][line]['character'] == 'rachel':
            rachelLines.append(FriendsDict[episode][line]['text'])
        elif FriendsDict[episode][line]['character'] == 'phoebe':
            phoebeLines.append(FriendsDict[episode][line]['text'])
        elif FriendsDict[episode][line]['character'] == 'ross':
            rossLines.append(FriendsDict[episode][line]['text'])
    
    if monicaLines != []:
        monica.append(" ".join(monicaLines))
    elif monicaLines == []:
        monica.append(monica[episode - 2])
    
    if rossLines != []:
        ross.append(" ".join(rossLines))
    elif rossLines == []:
        ross.append(ross[episode - 2])
    
    if chandlerLines != []:
        chandler.append(" ".join(chandlerLines))
    elif chandlerLines == []:
        chandler.append(chandler[episode - 2])
        
    if phoebeLines != []:
        phoebe.append(" ".join(phoebeLines))
    elif phoebeLines == []:
        phoebe.append(phoebe[episode - 2])
   
    if rachelLines != []:
        rachel.append(" ".join(rachelLines))
    elif rachelLines == []:
        rachel.append(rachel[episode - 2])
    
    if joeyLines != []:
        joey.append(" ".join(joeyLines))
    elif joeyLines == []:
        joey.append(joey[episode - 2])
        
       
#%% --- Sentiment Analysis for each character over each episode
    #   Using code from https://github.com/nik0spapp/usent

import numpy as np

sentiment = Sentiment()
rossScore = []
rossVariance = []
monicaScore = []
monicaVariance = []
phoebeScore = []
phoebeVariance = []
chandlerScore = []
chandlerVariance = []
joeyScore = []
joeyVariance = []
rachelScore = []
rachelVariance = []

#sentiment.analyze method from https://github.com/nik0spapp/usent/blob/master/sentiment.py
for episode in range(0, len(FriendsDict)):
    rossSentiment = sentiment.analyze([unicode(ross[episode], errors = 'ignore')])
    rossScore.append(np.mean(rossSentiment['scores']))
    rossVariance.append(np.var(rossSentiment['scores']))

    monicaSentiment = sentiment.analyze([unicode(monica[episode], errors = 'ignore')])
    monicaScore.append(np.mean(monicaSentiment['scores']))
    monicaVariance.append(np.var(monicaSentiment['scores']))

    phoebeSentiment = sentiment.analyze([unicode(phoebe[episode], errors = 'ignore')])
    phoebeScore.append(np.mean(phoebeSentiment['scores']))
    phoebeVariance.append(np.var(phoebeSentiment['scores']))

    chandlerSentiment = sentiment.analyze([unicode(chandler[episode], errors = 'ignore')])
    chandlerScore.append(np.mean(chandlerSentiment['scores']))
    chandlerVariance.append(np.var(chandlerSentiment['scores']))

    joeySentiment = sentiment.analyze([unicode(joey[episode], errors = 'ignore')])
    joeyScore.append(np.mean(joeySentiment['scores']))
    joeyScore.append(np.var(joeySentiment['scores']))

    rachelSentiment = sentiment.analyze([unicode(rachel[episode], errors = 'ignore')])
    rachelScore.append(np.mean(rachelSentiment['scores']))
    rachelVariance.append(np.var(rachelSentiment['scores']))

    print "\n\n\n ----------------------- \n\n\n episode " + str(episode) + \
    "\n\n\n ----------------------- "

#%% Get a dataframe of the unsupervised sentiment analysis by character, by show

import pandas as pd
ScoresFrame = pd.DataFrame()
ScoresFrame['rossScore'] = rossScore
ScoresFrame['rachelScore'] = rachelScore
ScoresFrame['phoebeScore'] = phoebeScore
ScoresFrame['monicaScore'] = monicaScore
ScoresFrame['chandlerScore'] = chandlerScore
ScoresFrame['rossVariance'] = rossVariance
ScoresFrame['chandlerVariance'] = chandlerVariance
ScoresFrame['monicaVariance'] = monicaVariance
ScoresFrame['phoebeVariance'] = phoebeVariance
ScoresFrame['rachelVariance'] = rachelVariance
ScoresFrame['joeyScore'] = joeyScore
ScoresFrame['joeyVariance'] = joeyVariance
ScoresFrame['episode'] = episode_name
ScoresFrame['season'] = season

        


            

        
            
