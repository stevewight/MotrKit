MotrKit
=======

Session based event tracking. 

Currently a working prototype app, the ultimate goal for MoTrKit is to create an abstract set of classes for the tracking of objects in a space, over a period of time.  This abstraction will allow for the simple insertion of object tracking into an iOS application. 

You can currently start a session, save the location of an object when it moves 31 meters and on a button fire.  The session can then be saved and later viewed (using core data, with two entities [Sessions, EventLocations]).  
