IaC => Terraform

Kurulumlar yapılırken GCP nin 3 aylık ücretsiz kredi avantajından faydalanabilirsiniz.

1\. Google Kubernetes Engine kullanılarak bir Kubernetes cluster oluşturulmalıdır. Cluster ın logging ve monitoring özellikleri disable edilmelidir.

2\. 2 adet node pool açılmalıdır. 1. node pool un adı main-pool 2. node pool un adı application-pool olmalıdır. Bu node pool'lar açılırken n2d makina type kullanılmalı ve cluster europe-west-1 region da açılmalıdır. main-pool da auto scaling kapalı olurken application-pool un 1 - 3 node arasında auto scaling yapması sağlanmalıdır.

3\. Cluster üzerine YAML manifest kullanarak örnek bir Kubernetes uygulaması deploy edilmeli ve bu uygulamanın sadece application-pool üzerinde çalışması sağlanmalıdır.

4\. Deploy edilen bu uygulamada HPA aktifleştirilmelidir. CPU kullanımı %25'in üzerinde olursa deployment 1 - 3 pod arası scale olması sağlanmalıdır.

5\. Cluster üzerinde Prometheus ve Grafana kurulumu yapılmalı ve Kubernetes metriklerinin prometheus a aktarılması sağlanmalıdır.

6\. Grafana üzerinden pod restart alarmı kurulmalıdır.

7\. Cluster a keda kurulumu yapılmalı ve 4. madde keda kullanılarak da yapılabilmelidir. *

8\. Cluster a istio kurulumu yapılmalıdır. (istiod, istio-ingress, istio-egress) *