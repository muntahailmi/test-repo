retryable_errors = [
  ".*HTTP response was nil; connection may have been reset.*",
  ".*performing CreateOrUpdate.*",
  ".*connection reset by peer.*",
  ".*transport connection broken.*"
]
 
retry_max_attempts = 10
retry_sleep_interval_sec = 30
 
terraform { 
  # Add retry configuration
  extra_arguments "retry_args" {
    commands  = [
      "apply",
      "plan",
      "destroy"
    ]
    arguments = []
  }
}
remote_state {
  backend = "gcs"
  config = {
    bucket = get_env("REMOTESTATE_BUCKET")
    prefix = get_env("REMOTESTATE_PREFIX","terraform.state")
    project = get_env("REMOTESTATE_PROJECT")
    location = get_env("REMOTESTATE_LOCATION")
  }
}
