# Bag-of-Visual-Words-for-Image-Classification
CMU 16720 Computer Vision Project, a from-scratch implementation of image classification system using Harris detector and Bag of words method.
## Introduction  
This project implements a scene classification system using traditional detector and descriptor approach, which is bag of visual words instead of CNN. The classification system has been tested on SUN Image database consisting of 8 secene categories including campus, bedroom, etc. The current accuracy is 48.75% with Harris detector, chi-square distance methods.  
**_Note that this result is definitely uncomparable to state-of-art neural network which can easily achieve accuracy over 95%, however, this is a good practice to code a recognition system by hand, and have a deep and detailed understanding of how computer vision works._**  
## Files contained  
### Stage 1: Build visual words dictionary  
**/src/filterBank.mat  
/src/createFilterBank.m  
/src/extractFilterResponses.m  
/src/getHarrisPoints.m  
/src/getRandomPoints.m  
/src/getDictionary.m  
/src/computerDictionary.m  
/src/dictionaryHarris.mat  
/src/dictionaryRandom.mat**    
A sample of extracted responses by filtering filter bank with different filters  
<img src="https://github.com/ziliHarvey/Bag-of-Visual-Words-for-Image-Classification/raw/master/filter_responses.png" width=30% height=30%>  
Detected points (mostly corners) by Harris detector on a campus image.  
<img src="https://github.com/ziliHarvey/Bag-of-Visual-Words-for-Image-Classification/raw/master/harris_detection.png" width=25% height=25%>
### Stage 2: Build recognition system  
**/src/getVisualWords.m  
/src/batchToVisualWords.m  
/data/traintest.mat  
/src/getImageFeatures.m  
/src/buildRecognitionSystem.m  
/src/visionHarris.mat  
/src/visionRandom.mat**    
A sample of visual wordmap, in which each pixel is mapped to a closest (shortest pdist2 distance) word in the dictionary obtained from Stage 1  
<img src="https://github.com/ziliHarvey/Bag-of-Visual-Words-for-Image-Classification/raw/master/wordmap_for_harris_dictionary.png" width=25% height=25%>
### Stage 3: Evaluate recognition system  
**/src/getImageDistance.m  
/src/evaluateRecognitionSystem.m  
/data**  
