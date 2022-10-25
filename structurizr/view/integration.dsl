systemContext integrationSystem "IntegrationSystemContext" {
    include *
    exclude "* -> OrderSystem"
    exclude "* -> productSystem"
    autoLayout
}

container integrationSystem "IntegrationSystem" {
    include *
    include "* -> integrationSystem"
    include "integrationSystem -> *"
    autoLayout
}