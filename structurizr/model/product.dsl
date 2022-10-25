
productSystem = softwareSystem "Product System" "Manages Products" {
    productCacheContainer = container "Product Cache" "Cache Storage for Product Data" "Redis" "Database"
    productStorageContainer = container "Product Storage" "Stores Products" "CosmosDB/MongoDB" "Database"
    productAuditStorageContainer = container "product Audit Storage" "Stores Product Audit Data" "CosmosDB/MongoDB" "Database"
    
    productApiContainer = container "Product API" "Manages Products" "ASP.NET Core, OpenAPI" {
        productControllerComponent = component "Product Controller" "Manages Products" "ASP.NET Core API Controller"
    }

    productApiContainer -> productAuditStorageContainer "Writes Product Audit Data" "" "sync"
    productApiContainer -> productCacheContainer "Reads & Writes Product Cache Data" "" "sync"
    productApiContainer -> productStorageContainer "Reads & Writes Product Source Data" "" "sync"
}