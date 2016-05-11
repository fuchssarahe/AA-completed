# w1d2 relflection

**Topics covered:** references, scope, passing method defaults

**References:** Discussion covered attr_readers/accessor/writers in detail. It was great to hear further explanations of the more detailed intricacies of the concepts, particuarly in their relation to immutability.

_Immutability:_
The best part of the discussion was how the concept related to immutability. The abiliity of an atrribute of a class to be edited from outside a class is related to the immutability of the object and the writers/readers available.

So, if an attribute reader is available for an attribute of a class, and that attribute is of a class which is mutable, then that object can indeed be altered from outside the class. As long as the object is still stored in the same location in memory, then the object is simply being altered rather than reassigned.

In line with this idea, if an object within a class has an att_reader available, the object cannot be reassigned from outside of the class.

_Code Style:_
Switching gears, attr_readers/writers are also designed to be useful from within the class. It had not occurred to me that one might use this functionality within the class rather than using instance variables exclusively.

A reason one might use attr_readers/writers rather than instance variables is to optimize for de-bugging. If an object is causing trouble within the class, including break-points in the attr_* would allow for troubleshooting in a more sweeping sense, as any time the variable is used, it would need to pass through the attr_*.

Personally, I think that relying more heavily on instance variables within a class makes for easier-to-read code. The @ symbol at the front of all instance variables immediately lets the reader know exactly what relationship the variable plays within the class without needing to refer to any attr_reader/writers/accessors. This could definitely become helpful if any other individual ever needs to edit or add to that particular code base.  

**Defaults:** Turns out, you can't pass a block as a default parameter in an argument. It must be set within the method itself. After learning how to use ||= yesterday, the logic behind creating and assigning blocks made sense.