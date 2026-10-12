{{- define "hurtz.fullname" -}}
{{- if contains .Chart.Name .Release.Name }}
{{- .Release.Name | trunc 54 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 54 | trimSuffix "-" }}
{{- end }}
{{- end }}

{{- define "hurtz.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* Usage: include "hurtz.selectorLabels" (list . "backend") */}}
{{- define "hurtz.selectorLabels" -}}
app.kubernetes.io/name: {{ (index . 0).Chart.Name }}
app.kubernetes.io/instance: {{ (index . 0).Release.Name }}
app.kubernetes.io/component: {{ index . 1 }}
{{- end }}

{{/* Name for objects in the shared cluster namespace; prefixed to avoid clashes between releases. */}}
{{- define "hurtz.dbResourceName" -}}
{{- printf "%s-%s" .Release.Namespace (include "hurtz.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "hurtz.publicUrl" -}}
https://{{ .Values.pangolin.subdomain }}.{{ required "pangolin.domainName is required" .Values.pangolin.domainName }}
{{- end }}

