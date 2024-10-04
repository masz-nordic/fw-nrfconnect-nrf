# Copyright (c) 2024 Nordic Semiconductor
#
# SPDX-License-Identifier: LicenseRef-Nordic-5-Clause

# Update eGPIO images KConfig based on SDP configuration.
#
# Usage:
#   egpio_update_kconfig()
#
function(egpio_update_kconfig)
  if(SB_CONFIG_EGPIO_BACKEND_MBOX)
    foreach(image ${PRE_CMAKE_IMAGES})
      set_config_bool(${image} CONFIG_GPIO_NRFE_EGPIO_BACKEND_MBOX y)
    endforeach()
    sysbuild_cache_set(VAR ${DEFAULT_IMAGE}_SNIPPET APPEND REMOVE_DUPLICATES "emulated-gpio-mbox")
    message(STATUS "eGPIO: Using MBOX backend")
  elseif(SB_CONFIG_EGPIO_BACKEND_ICMSG)
    foreach(image ${PRE_CMAKE_IMAGES})
      set_config_bool(${image} CONFIG_GPIO_NRFE_EGPIO_BACKEND_ICMSG y)
    endforeach()
    set_config_bool(flpr_egpio CONFIG_IPC_SERVICE y)
    set_config_bool(flpr_egpio CONFIG_IPC_SERVICE_BACKEND_ICMSG y)
    sysbuild_cache_set(VAR ${DEFAULT_IMAGE}_SNIPPET APPEND REMOVE_DUPLICATES "emulated-gpio-icmsg")
    message(STATUS "eGPIO: Using ICMSG backend")
  endif()
endfunction()

# If eGPIO FLPR application is enabled, update Kconfigs
if(SB_CONFIG_EGPIO_FLPR_APPLICATION)
  egpio_update_kconfig()
endif()
