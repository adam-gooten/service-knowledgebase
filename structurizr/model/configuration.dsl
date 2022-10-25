configurationSystem = softwareSystem "Configuration System" "Manages Configuration" {
    configurationStorageContainer = container "Configuration Storage" "Storage for Configuration Data" "CosmosDB/MongoDB" "Database"
    configurationCacheContainer = container "Configuration Cache" "Cache Storage for Configuration Data" "Redis" "Database"

    configurationApiContainer = container "Configuration API" "API for managing and retrieving Configurations" "ASP.NET Core" {
        configurationApiControllerComponent = component "Configuration Controller" "Endpoints for manging configuration" "ASP.NET Core API Controller"
    }

    configurationApiContainer -> configurationCacheContainer "Reads & Writes Cache Data" "" "sync"
    configurationApiContainer -> configurationStorageContainer "Reads & Writes Source Data" "" "sync"
}