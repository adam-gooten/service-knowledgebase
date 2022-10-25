orderSystem = softwareSystem "Order System" "Manages Orders" {
    orderStorage = container "Order Storage" "Stores Orders" "CosmosDB/MongoDB" "Database"
    orderAuditStorage = container "Order Audit Storage" "Stores Order Audit Data" "CosmosDB/MongoDB" "Database"

    orderApiContainer = container "Order API" "Receives Orders for asynchronous Processing" "ASP.NET Core, OpenAPI" {
        orderControllerComponent = component "Order Controller" "Receives Orders for asynchronous processing" "ASP.NET Core API Controller"
    }

    orderApiContainer -> orderAuditStorage "Writes Audit Data" "" "sync"
    orderApiContainer -> orderStorage "Reads & Writes Order Data" "" "sync"
}