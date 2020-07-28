# CanvasPinch
QtQuick Application to show how to use a Canvas element with PinchArea.

-------

I have been using Qt QML recently and sometimes I find myself trying to solve small issues because of my lack of knowledge. So I decided to share these small issues whenever I manage to solve them because maybe someone else out there is having the same problem.  o/  Wave back if it's your case!

In this example I was suffering to implement pinch gesture inside a Canvas element. I was able to scale and rotate it, but not to drag it. And I could not understand why or even find some clue on the internet. 

I was recently studying the basics of Qt QML, specifically about anchors and I realized that in general the examples about canvas will show you an application window with some defined dimension and inside it a Canvas element achored to the application window: anchors.fill: parent

The problem is, if you are anchoring it to the application window limits, you will not be able to freely drag it using the pinch gesture. So, as by magic, I took out the anchors property and I could not see much... That was a bummer... But them, back to basics again, I remembered that in Qt QML you need to define an element dimension. If you miss it, by default, it will be zero (I wonder why...). 

So finally, I just needed to define the Canvas dimension using the width and height properties and BAM: that was it! I managed to have a Canvas element that I can freely scale, rotate and drag around using the pinch gesture.

I hope you guys enjoy it.
Please let me know if this helped you.
And please, please, please, if I said something wrong just correct me! This is how I will keep learning!

Cheers!

-------
## References

The Paint code is based on *[DuarteCorporation Tutoriales](https://youtu.be/DBD7GpuKQxk)*
