workspace "Gooten Inc" {
    model {
        partnerPlatformsSystem = softwareSystem "External Merchant Platforms" "Stores utilizing external eCommerce Platforms" "External System"
        legacyOrderApiSystem = softwareSystem "Legacy Order API" "Legacy Order API" "External System"

        !include model/order.dsl
        !include model/configuration.dsl
        !include model/integration.dsl
        !include model/product.dsl

        // System Relationships
        integrationSystem -> configurationApiContainer "Obtains Configuration from" "HTTPS+JSON" "sync"
        integrationSystem -> orderApiContainer "Creates Orders using" "HTTPS+JSON" "sync"
        orderSystem -> configurationApiContainer "Obtains Configuration from" "HTTPS+JSON" "sync"
        orderSystem -> legacyOrderApiSystem "Creates Orders using" "HTTPS+JSON" "sync"
        orderSystem -> productSystem "Obtains Product Data from" "HTTPS+JSON" "sync"
        productSystem -> configurationApiContainer "Obtains Configuration from" "HTTPS+JSON" "sync"
    }

    views {
        /**
         * System Landscape Diagram
         */
        systemLandscape "SystemLandscape" {
            include *
            exclude partnerPlatformsSystem
            autoLayout
        }

        !include view/configuration.dsl
        !include view/integration.dsl
        !include view/order.dsl
        !include view/product.dsl

        !include view/styles.dsl
    }
}