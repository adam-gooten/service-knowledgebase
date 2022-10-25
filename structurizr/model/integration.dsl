integrationSystem = softwareSystem "Integration System" "Integrates with 3rd Party Systems" {
    webhhookStorageContainer = container "Webhook Storage" "Stores received Webhooks for Disaster Recorvery and Audit" "CosmosDB" "Database"

    orderWebhookProcessorContainer = container "Order Webhook Processor" "Processes Webhooks containing Order Data" ".NET Core" {
        orderMapperComponent = component "Webhook Controller" "Receives Webhooks for asynchronous processing" "ASP.NET Core API Controller"
    }
    
    webhookApiContainer = container "Webhook Service" "Receives Webhooks for asynchronous Processing" "ASP.NET Core, OpenAPI" {
        webhookControllerComponent = component "Webhook Controller" "Receives Webhooks for asynchronous processing" "ASP.NET Core API Controller"
    }

    webhookApiContainer -> orderWebhookProcessorContainer "Queues Webhooks for" "Kafka"
    webhookApiContainer -> webhhookStorageContainer "Stores Webhooks in" "MongoDB" "sync"
    orderWebhookProcessorContainer -> orderApiContainer "Queues Orders for" "Kafka"
}