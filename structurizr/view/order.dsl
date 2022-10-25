systemContext orderSystem "OrderSystemContext" {
    include *
    exclude "* -> *"
    include "* -> orderSystem"
    include "orderSystem -> *"
    autoLayout
}

container orderSystem "orderSystem" {
    include *
    include "* -> orderSystem"
    include "orderSystem -> *"
    autoLayout
}