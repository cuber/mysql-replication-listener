# - Find mysqlclient
# Find the native MySQL includes and library
#
#  MYSQL_INCLUDE_DIR - where to find mysql.h, etc.
#  MYSQL_LIBRARIES   - List of libraries when using MySQL.
#  MYSQL_FOUND       - True if MySQL found.

IF (MYSQLDEV_INCLUDE_DIR)
  # Already in cache, be silent
  SET(MYSQLDEV_FIND_QUIETLY TRUE)
ENDIF (MYSQLDEV_INCLUDE_DIR)

FIND_PATH(MYSQLDEV_INCLUDE_DIR my_aes.h
          $ENV{MYSQLDEV_DIR}/include
)

IF (MYSQLDEV_INCLUDE_DIR)
  SET(MYSQLDEV_FOUND TRUE)
  INCLUDE_DIRECTORIES(${MYSQLDEV_INCLUDE_DIR})
ENDIF(MYSQLDEV_INCLUDE_DIR)

IF (MYSQLDEV_FOUND)
  IF (NOT MYSQLDEV_FIND_QUIETLY)
    MESSAGE(STATUS "Found MySQLdev: ${MYSQLDEV_INCLUDE_DIR}")
  ENDIF (NOT MYSQLDEV_FIND_QUIETLY)
ELSE (NOT MYSQLDEV_FOUND)
  IF (MYSQLDEV_FIND_REQUIRED)
    MESSAGE(FATAL_ERROR "Could NOT find MySQLdev source")
  ENDIF (MYSQLDEV_FIND_REQUIRED)
ENDIF (MYSQLDEV_FOUND)

MARK_AS_ADVANCED(
  MYSQLDEV_INCLUDE_DIR
  )

