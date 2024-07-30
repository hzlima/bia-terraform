resource "aws_ecs_task_definition" "bia-web" {
  family       = "task-def-bia"
  network_mode = "bridge"

  container_definitions = jsonencode([{
    name              = "bia",
    image             = "${aws_ecr_repository.bia.repository_url}:latest", // Imagem do ECR
    essential         = true                                               // Container essencial
    portMappings      = [{ containerPort = 8080, hostPort = 80 }],         // Mapeamento de porta
    cpu               = 1024                                               // 1 VCPU
    memoryReservation = 400                                                // Soft Limit 400MB
    environment = [
      { name = "DB_PORT", value = "5432" },                          // Porta do postgree ?
      { name = "DB_HOST", value = "${aws_db_instance.bia.address}" } // Endereço do Banco
    ]
    logConfiguration = {
      logDriver = "awslogs",
      options = {
        "awslogs-region"        = "us-east-1",
        "awslogs-group"         = aws_cloudwatch_log_group.ecs_bia_web.name, // Endereço do log no Cloud Watch
        "awslogs-stream-prefix" = "bia"
      }
    },
  }])
}
