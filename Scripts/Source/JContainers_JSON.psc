scriptName JContainers_JSON
{
Get the JSON string for a JContainer:
```psc
JContainers_JSON.Serialize(containerId)
```

Or create a JContainer from a JSON string:
```psc
int containerId = JContainers_JSON.Parse("...")
```

With a shortcut for logging JContaines to the Papyrus log as JSON:
```psc
JContainers_JSON.Log(containerId)
JContainers_JSON.Log(containerId, "Optional Description")
```
}

string function Serialize(int object) global
    if ! object
        return ""
    endIf
    string filePath = "Data/JContainers.JSON/Serialize/" + object + ".json"
    JValue.writeToFile(object, filePath)
    string json = MiscUtil.ReadFromFile(filePath)
    JContainers.removeFileAtPath(filePath)
    return json
endFunction

int function Parse(string json) global
    if ! json
        return 0 
    endIf
    string filePath = "Data/JContainers.JSON/Parse/" + Utility.RandomFloat(10000, 1000000) + ".json"
    MiscUtil.WriteToFile(filePath, json, append = false)
    int object = JValue.readFromFile(filePath)
    JContainers.removeFileAtPath(filePath)
    return object
endFunction

function Log(int object, string description = "") global
    if description
        Debug.Trace(description + ": (" + object + ") :" + Serialize(object)) 
    else
        Debug.Trace("JContainer : (" + object + ") : " + Serialize(object))
    endIf
endFunction
