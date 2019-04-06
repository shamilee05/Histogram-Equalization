disp('Histogram Equalization');
gray=imread('car_hist.jpg');
[row,column]=size(gray);
L=256;

[pixelCounts,grayLevels]=imhist(gray);
sum_pixels=sum(pixelCounts);

for i=1:L
    pdf(i)=pixelCounts(i)./sum_pixels;
end

cdf(1)=pdf(1);

for i=2:L
    cdf(i)=pdf(i)+cdf(i-1);
end

for i=1:L
    lcdf(i)=(L-1).*cdf(i);
end

r=round(lcdf);

pdf1=transpose(pdf);
cdf1=transpose(cdf);
lcdf1=transpose(lcdf);
r1=transpose(r);

T=table(grayLevels,pixelCounts,pdf1,cdf1,lcdf1,r1)

new_pixel_col=zeros(256,1);
for i=1:L
    a=grayLevels(i);
    new_pixel_count=0;
    for j=1:L
        if a==r1(j)
            new_pixel_count=new_pixel_count+pixelCounts(j);
        end
    end
    new_pixel_col(i)=new_pixel_count;
end

new_image=uint8(zeros(row,column));
for i=1:row
    for j=1:column
        a=gray(i,j);
        for k=1:L
            if a==grayLevels(k)
                new_image(i,j)=r1(k);
            end
       end
    end
end

%Original Image
subplot(2,2,1);
imshow(gray);
title('Original Image');

%New Image
subplot(2,2,2);
imshow(new_image);
title('New Image');

%Original Histogram
subplot(2,2,3);
imhist(gray);
title('Original Histogram');
xlabel('Gray Levels');
ylabel('Original no. of pixels');

%Histogram obtained on equalization
subplot(2,2,4);
imhist(new_image);
title('New Histogram');
xlabel('Gray Levels');
ylabel('New no. of pixels');

%For testing, direct method: g=histeq(’elvis_low_contrast.bmp’)
%I=imread('babyincradle.png');
%J=histeq(I);
%imshowpair(I,J,'montage');
%axis off;