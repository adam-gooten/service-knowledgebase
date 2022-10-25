systemContext configurationSystem "ConfigurationSystemContext" {
    include *
    exclude "* -> OrderSystem"
    exclude "* -> productSystem"
    autoLayout
}

container configurationSystem "ConfigurationSystem" {
    include *
    exclude "* -> OrderSystem"
    exclude "* -> productSystem"
    autoLayout
}