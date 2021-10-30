###https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming

### Databases

variable "azure_sql_server_name" {
    type        = string
    description = "sql-<app name>-<environment>"  
}

variable "azure_sql_db_name" {
    type        = string
    description = "sqldb-<database name>-<environment>"  
}

variable "azure_cosmos_db_name" {
    type        = string
    description = "cosmos-<app name>-<environment>"  
}

variable "azure_redis_instance_name" {
    type        = string
    description = "redis-<app name>-<environment>"  
}
