@echo off
setlocal

if not defined SASS_LIBSASS_PATH (
  pushd .
  cd "%~dp0..\..\"
  set SASS_LIBSASS_PATH="%CD%"
  popd
)
echo SASS_LIBSASS_PATH variable is %SASS_LIBSASS_PATH%

if NOT EXIST "%SASS_LIBSASS_PATH%" (
  echo Make Dir "%SASS_LIBSASS_PATH%"
  REM mkdir "%SASS_LIBSASS_PATH%"
)
if NOT EXIST "%SASS_LIBSASS_PATH%\.git\" (
  echo Clone to "%SASS_LIBSASS_PATH%"
  REM git clone https://github.com/sass/libsass.git "%SASS_LIBSASS_PATH%"
) ELSE (
  echo "LibSass already exists, skiping Git Clone"
)

if not defined "%SASS_SPEC_PATH%" (
  pushd .
  cd "%~dp0..\..\sass-spec"
  set SASS_SPEC_PATH="%CD%"
  popd
  REM echo "SASS_SPEC_PATH variable is missing, so using "%SASS_SPEC_PATH%"
)
echo SASS_SPEC_PATH variable is %SASS_SPEC_PATH%

if NOT EXIST "%SASS_SPEC_PATH%" (
  echo Make Dir "%SASS_SPEC_PATH%"
)

if NOT EXIST "%SASS_SPEC_PATH%\.git" (
  echo Clone to "%SASS_SPEC_PATH%"
  REM git clone https://github.com/sass/sass-spec.git "$SASS_SPEC_PATH"
) ELSE (
    echo "sass-spec already exists, skiping Git Clone"
)
git -C "%SASS_SPEC_PATH%" describe --abbrev=4 --dirty --always --tags
REM exit 0