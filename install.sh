#! /bin/sh

OTHER_PROJECTS="${OTHER_PROJECTS}
mulle-c/mulle-c-developer;latest
mulle-sde/mulle-test;latest"
SDE_PROJECTS="${SDE_PROJECTS}
mulle-sde-developer;latest" 

echo "${GITHUB_REF} = ${GITHUB_REF}" >&2

case "${GITHUB_REF}" in
   prerelease)
      MULLE_SDE_DEFAULT_VERSION="${MULLE_SDE_DEFAULT_VERSION:-${GITHUB_REF}}"
   ;;
   
   *)
      MULLE_SDE_DEFAULT_VERSION="${MULLE_SDE_DEFAULT_VERSION:-release}"
   ;;
esac

export MULLE_SDE_DEFAULT_VERSION
export SDE_PROJECTS
export OTHER_PROJECTS

curl -L -O 'https://raw.githubusercontent.com/mulle-sde/mulle-sde/${MULLE_SDE_DEFAULT_VERSION}/bin/installer-all' && \
chmod 755 installer-all && \
./installer-all ~ no
