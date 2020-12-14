Gesture Recognition using Convolutional Neural Network
Adrian Ruvalcaba
Digital Image Processing
Fall 2020

Contents:
MATLAB Scripts
- createDatabase
- imageManipulator
- networkTester
- networkTrainer

Images
- Gestures
- Validation
- Testing Images
- Output Images

Reports
- Final Report
- Proposal

Trained Networks
- finalClassifier
- perfectGestureClassifier


Instructions for Use:

The network is already trained and ready. To test the network, launch networkTester.m and run the script.
The program should pull nine random images from the validation dataset and perform the network classification on it.
The results of the network will be displayed as a label above the image.
Run the program multiple times to see the different results achieved from the trained network.

To see the images in the Final Report more clearly along with additional output images. Please refer to Images\Output.
The output image of the final network is shown as image finalTest(99.16).png 
The verbose console output of the final network is shown as image verbos.png

The trained networks can be accessed under the Trained Networks folder
finalClassifier refers to the network used in the Final Report that includes random images from the internet. This network has accuracy of 99.16%
perfectClassifier refers to the original network that only uses my own dataset. This network has accuracy of 100%