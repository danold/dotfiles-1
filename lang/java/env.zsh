if [[ "$(_os)" == "macos" ]]; then
  # subshell-elimination: uncomment in case of issues with the static locations
  # export JAVA_8_HOME="$(/usr/libexec/java_home -v 1.8)"
  export JAVA_8_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home"
  export JAVA_11_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home"
  export JAVA_LATEST_HOME="/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home"
  export JAVA_GRAAL_HOME=/Library/Java/JavaVirtualMachines/graalvm-ce-java11-21.1.0/Contents/Home

  alias java8='export JAVA_HOME=$JAVA_8_HOME'
  alias java11='export JAVA_HOME=$JAVA_11_HOME'
  alias javalatest='export JAVA_HOME=$JAVA_LATEST_HOME'
  alias graal='export JAVA_HOME=$JAVA_GRAAL_HOME'
fi

if [[ "$(_os)" == "macos" ]]; then
  # default to latest
  javalatest
  # java8
fi
