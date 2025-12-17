# ElastiCache Subnet Group
resource "aws_elasticache_subnet_group" "taskflow" {
  name           = "${var.app_name}-redis-subnet"
  subnet_ids     = [aws_subnet.private_1.id, aws_subnet.private_2.id]
}

# ElastiCache Redis Cluster - FIXED
resource "aws_elasticache_cluster" "taskflow" {
  cluster_id           = "${var.app_name}-redis"
  engine               = "redis"
  engine_version       = "7.0"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis7"
  port                 = 6379
  
  subnet_group_name  = aws_elasticache_subnet_group.taskflow.name
  security_group_ids = [aws_security_group.elasticache.id]

  tags = {
    Name = "${var.app_name}-redis"
  }
}

output "elasticache_endpoint" {
  value = aws_elasticache_cluster.taskflow.cache_nodes[0].address
}

output "elasticache_port" {
  value = aws_elasticache_cluster.taskflow.port
}
