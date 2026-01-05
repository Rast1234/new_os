# to export services: nssm list + nssm dump $name

# prometheus (copied as files at later stage)
nssm install prometheus "C:\Program Files\prometheus\prometheus.exe"
nssm set prometheus AppParameters "--web.enable-lifecycle --storage.tsdb.retention.size=50GB"
nssm set prometheus AppDirectory "C:\Program Files\prometheus"
nssm set prometheus AppExit Default Restart
nssm set prometheus DisplayName "prometheus (NSSM)"
nssm set prometheus ObjectName LocalSystem
nssm set prometheus Start SERVICE_AUTO_START
nssm set prometheus Type SERVICE_WIN32_OWN_PROCESS

#grafana is also NSSM service, but set up automatically by its own installer
