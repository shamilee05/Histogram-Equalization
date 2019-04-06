# Histogram-Equalization
A basic MATLAB program to perform histogram equalisation on any image to improve its contrast.

**Histogram equalization** is an image processing technique wherein the intensity values of the pixels of an image are modified using the histogram of the image.
For an image which lacks proper contrast, the intensity values of the pixels are such that they fall under **a very narrow range**. This means that the intensity of
the pixels have similar or similar-ranged values instead of being equally spaced out across the entire range of the pixel intensity.

*For example, consider a grayscale image (wherein the intensity of each pixel would lie between 0 and 255). If this image lacks proper contrast, most of its pixels would
have intensities between a certain narrow range, say 100-150 instead of being equally spaced out between 0 and 255. This makes the image look darker and unclear to some extent.*

Histogram equalization solves this problem by modifying the histogram of the image in such a manner that the pixel intensities fall under **a wider range**.

The algorithm/ methodology followed by the program is as given below:
1. Take an image as input and convert it to **grayscale**.
2. Find out the **histogram** for the gray image, i.e. **the number of pixels falling under a given grayscale intensity**. For example, for an 8-bit per pixel grayscale image, the values for the intensity of each of the pixels would fall in the range 0-255 (L=256).
3. With the pixel and the corresponding gray level intensity, apply the **pdf (Probability Density Function)** on the value denoting the no. of pixels for each of the intensity levels.
4. Next, apply the **cdf (Cumulative Distribution Function)** on the pdf values.
5. Multiply the cdf values with the value **(L-1) wherein L is 2^n where n is the number of pixels of the image**.
6. The value cdf*(L-1) is now **rounded off** to obtain the new gray scale intensity value for that corresponding pixel.
7. For the given input image in gray, change the values of the pixels falling in the new grayscale intensities. This image has now **equal number of pixels falling in all the grayscale intensity values**.

Instances of how the program works on a couple of images are as shown below:

![alt text](https://github.com/shamilee05/Histogram-Equalization/blob/master/car.PNG)

<br>

![alt text](https://github.com/shamilee05/Histogram-Equalization/blob/master/scenary.PNG)
