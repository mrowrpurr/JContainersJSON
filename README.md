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