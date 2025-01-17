#! /bin/sh -x

OTHER_PROJECTS="${OTHER_PROJECTS}
mulle-sde/mulle-test;"
SDE_PROJECTS="${SDE_PROJECTS}
mulle-sde-developer;"

echo "GITHUB_REF = ${GITHUB_REF}" >&2
case "${GITHUB_REF}" in
   */prerelease)
      MULLE_SDE_DEFAULT_VERSION="latest-prerelease"
   ;;

   */*[-]prerelease)
      MULLE_SDE_DEFAULT_VERSION="`basename -- "${GITHUB_REF}"`"
   ;;

   *)
      MULLE_SDE_DEFAULT_VERSION="${MULLE_SDE_DEFAULT_VERSION:-release}"
   ;;
esac

export MULLE_SDE_DEFAULT_VERSION
export SDE_PROJECTS
export OTHER_PROJECTS

url="https://raw.githubusercontent.com/mulle-sde/mulle-sde/${MULLE_SDE_DEFAULT_VERSION}/bin/installer-all"

echo "Downloading installer-all from \"${url}\"" >&2
curl -L -O "${url}" && \
chmod 755 installer-all && \
echo "Executing installer-all" >&2
./installer-all ~ no
