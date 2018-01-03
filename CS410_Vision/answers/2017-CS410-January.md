### Question 1
(a)
// Note: This is basically assignment 1.
One approach to calibrate  camera, assuming we have 3D world coordinates and 2D image coordinates, set the 3D coordinates in homogeneous form by appending a 1 to the coordinates e.g [X Y Z] -> [X Y Z 1], then we need to generate a linear system equation named A of the form:
![A-matrix]("http://quicklatex.com/cache3/c8/ql_b541096a373e99c4d8c4635f1aeb19c8_l3.png")
We want to find the camera matrix or projection matrix, so we need to solve the linear system equation Ax = y, x being the camera matrix that we want to find, y is a zero matrix that has the same amount of rows as A. In order to solve we want to find the vector x that minimizes E = |Ax-y|^2, since y = 0 -> E = |Ax|^2, so the vector that minimizes E is the eigenvector that corresponds to the minimum eigenvalue of A transpose A (A^T A), x will be a 3x4 matrix, the camera matrix.

(b)
3D = [10 10 15] and  2D = [315.2 282.3]

3D point to homogeneous form = [10 10 15 1]
-xP^T = [-315.2 -315.2 -315.2 -315.2] * [10 10 15 1]
= [-3152 - 3152 -4728 -315.2]

-yP^T = [-282.3 -282.3 -282.3 -282.3] * [10 10 15 1]
= [-2823 -2823 -4234.5 -282.3]

A =[
[10 10 15 1 0  0 0  0  -3152 - 3152 -4728 -315.2],
[ 0  0 0  0 10 10 15 1 -2823 -2823 -4234.5 -282.3]]

(c)
To simplify the process we can use images taken by the camera to calibrate and those images should contain a pattern such as a checkerboard, then using a pattern matching algorithm and finding the coordinates of each corners of the checkerboard and using a matrix that represents the object points of the checkerboard's corners, modify all coordinates into 2D homogeneous coordinates, find the homography H of these two matrices, from these we'll be able to compute the camera matrix and distortion coefficients that we can use to undistort images from the camera.
When computing the projection between a planar target and an image we do not need the 3rd coordinate of the 3D coordinates, its value would be set to zero therefore there is no need to include the Z column to the camera matrix, which will affect the A matrix by becoming a 3x3 matrix instead of a 3x4 matrix. It is invertible because it is a square matrix.

Question 2
(a)
i) Using the image processing technique of labeling we will be able to differentiate from the three different pens.
Then we'll compute the Area with the zeroth-moment of the image, which we will use to compute the central moments of the 1st moments in order to get the object's centroid, it's position. To find the orientation we need to compute the 2nd moment, and find the axis of least second moment, and use the function theta = arctan b/a-c.

ii)
the zeroth moment of an image is the sum of all object pixels in an image.
the second moments of an image are the sums of
// need to find the what the second moment is.

we'll have an image for each object representing their boundary boxes, then another image for each representing the boundary boxes in the object's orientation, then overlay with the original image to show the boundary boxes around the objects.

(b)

1. only a pixel on an object's border can be deleted, meaning the pixel has at least one background in its neighborhood.
2. border pixels will be removed from one border orientation at a time, to make sure we do not completely remove an object in one go.
opposite border deletion allows us to obtain a skeleton close to the medial axis.
3. a critically connected pixel cannot be deleted other wise we'll end up with multiple objects instead of one.
4. an object should always keep its original length, therefore a pixel only containing one pixel in its neighborhood should not be deleted.

4 is useful since it means that an object that has been thinned to the max, the algorithm won't make any changes on a new iteration, so it can used to terminate the thinning process.

The one on the left is critically connected by the first predicate, if the pixel in the middle is deleted you will split the object into two.
The second one on the right is not critically connected because if the middle pixel is removed the object is still in one piece.

Question 3
(a)

continuous domain expression:
// Integrals from infinity to negative-infinity
g(i, j) = f * h = integral integral (i-m, j-n)h(m, n) dm dn

discrete domain expression:
g(i, j) = f * h = Sigma_m Sigma_n (i-m, j-n)h(m, n)

g(i, j) is the output image, f is the input image and h the filter kernel containing 9 distinct weights, f * h meaning the a pixel value is multiplied by its corresponding weight in the kernel/mask, then they are summed and it becomes the pixel's value in the new image.
This filtering operation is important in image processing since it can be used for noise suppression.

<span style="color: red">// need to find the relationship between the linear invariant and the convolution.

(b)
// We first need to apply the Sobel kernels onto the pixels

(a)
S_x = [
[(1 * 0) (0 * 0) (-1 * 200)],
[(2 * 0) (0 * 200) (-2 * 200)],
[(1 * 200) (0 * 200) (-1 * 200)]
]

S_x = 0+0-200+0+0-400+200+0-200 = -600

S_y = [
[(-1 * 0) (-2 * 0) (-1 * 200)],
[(0 * 0) (0 * 200) (0 * 200)],
[(1 * 200) (2 * 200) (1 * 200)]
]

S_y = 0+0-200+0+0+0+200+400+200 = 600

magnitude = |S_x| + |S_y|
= |-600| + |600| = 1200

orientation = arctan S_y/S_x = 600/-600 =  arctan -1 = -0.78..... not sure I need to go that far.

(b)
S_x = [
[(1 * 0) (0 * 0) (-1 * 0)],
[(2 * 200) (0 * 200) (-2 * 200)],
[(1 * 200) (0 * 200) (-1 * 20)]
]

S_x = 0+0+0+400+0-400+200+0-20 = 180

S_y = [
[(-1 * 0) (-2 * 0) (-1 * 0)],
[(0 * 200) (0 * 200) (0 * 200)],
[(1 * 200) (2 * 200) (1 * 20)]
]

S_y = 0+0+0+0+0+0+200+400+20 = 620

magnitude = |180| + |620| = 800

orientation = arctan S_y/S_x = arctan (620/180) = arctan 3.444 = 1.28...

(c)

The HoG provides us with  


Question 4
