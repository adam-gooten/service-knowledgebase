systemContext productSystem "ProductSystemContext" {
    include *
    exclude "* -> *"
    include "* -> productSystem"
    include "productSystem -> *"
    autoLayout
}

container productSystem "ProductSystem" {
    include *
    include "* -> productSystem"
    include "productSystem -> *"
    autoLayout
}