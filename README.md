# Infraestructura AWS con Terraform

Este proyecto utiliza Terraform para aprovisionar y gestionar una infraestructura modular en Amazon Web Services (AWS). El código está diseñado para separar los recursos en módulos lógicos, facilitando su mantenimiento y escalabilidad.

## 🏗️ Descripción del Proyecto

El proyecto coordina la creación de recursos a través de llamadas a módulos locales. La arquitectura general aprovisiona:

* **VPC (`modulo_vpc`):** Crea la red virtual privada base.


* **EC2 (`modulo_ec2`):** Despliega las instancias de cómputo.


* **S3 (`modulo_s3`):** Configura buckets para almacenamiento de objetos.


* **Load Balancer (`modulo_loadbalancer`):** Configura un balanceador de carga que se integra pasándole el ID de la VPC aprovisionada.



La infraestructura está configurada para desplegarse en la región `us-east-1` de AWS. Requiere una versión de Terraform igual o superior a `1.0.0` y utiliza la versión `~> 5.0` del proveedor de HashiCorp AWS.

## 📂 Estructura de Archivos

* `main.tf`: Archivo principal que invoca los diferentes módulos de la infraestructura.


* `outputs.tf`: Expone valores clave tras el despliegue, como los IDs de la VPC, las subredes y los grupos de seguridad (web y ALB).


* `providers.tf`: Contiene la configuración del proveedor en la nube y los requisitos de versión.



> 
> **Nota importante:** Este código asume que los directorios `./modulo_vpc`, `./modulo_ec2`, `./modulo_s3` y `./modulo_loadbalancer` existen en la raíz del proyecto y contienen sus respectivos archivos Terraform.
> 
> 

## ⚙️ Requisitos Previos

Antes de ejecutar este código, asegúrate de cumplir con los siguientes requisitos en tu entorno local:

1. **Terraform:** [Descargar e instalar Terraform](https://developer.hashicorp.com/terraform/downloads).
2. **AWS CLI:** [Descargar e instalar AWS CLI](https://aws.amazon.com/cli/).
3. **Credenciales de AWS:** Configura tus credenciales para que Terraform tenga permisos para crear los recursos. Ejecuta en tu terminal:
```bash
aws configure

```


*(Se te pedirá que ingreses tu `AWS Access Key ID`, `AWS Secret Access Key` y la región por defecto).*

## 🚀 Instrucciones de Despliegue

Sigue estos pasos en tu terminal, ubicado en el directorio raíz del proyecto, para desplegar la infraestructura:

**1. Inicializar el proyecto:**
Este comando descarga los plugins del proveedor de AWS y prepara el entorno de trabajo.

```bash
terraform init

```

**2. Revisar el plan de ejecución:**
Verifica exactamente qué recursos va a crear, modificar o destruir Terraform antes de aplicar cualquier cambio en AWS.

```bash
terraform plan

```

**3. Aplicar los cambios:**
Despliega la infraestructura en la nube. Terraform te mostrará el plan nuevamente y deberás escribir `yes` para confirmar la creación de los recursos.

```bash
terraform apply

```

## 📤 Salidas (Outputs)

Una vez que el comando `terraform apply` finalice con éxito, la consola imprimirá los siguientes valores que puedes usar para conectarte o auditar tu infraestructura:

* `vpc_id`: ID de la VPC principal.
* `subnet_ids`: IDs de las subredes creadas en la VPC.
* `sg_web_id`: ID del Security Group asignado a las instancias EC2.
* `sg_alb_id`: ID del Security Group asignado al Application Load Balancer.

## 🧹 Limpieza de Recursos

Si este es un entorno de prueba y deseas eliminar toda la infraestructura creada para evitar cargos recurrentes en tu cuenta de AWS, ejecuta:

```bash
terraform destroy

```

*(Deberás escribir `yes` para confirmar la eliminación de los recursos).*
