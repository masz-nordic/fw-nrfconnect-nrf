#
# Copyright (c) 2024 Nordic Semiconductor ASA
#
# SPDX-License-Identifier: LicenseRef-Nordic-5-Clause
#

function(sdp_assembly_generate)
  set(hrt_dir ${PROJECT_SOURCE_DIR}/src/hrt)
  set(hrt_src ${hrt_dir}/hrt.c)
  set(hrt_msg "Generating ASM file for Hard Real Time files.")

  zephyr_get_compile_options_for_lang(ASM hrt_opt)
  zephyr_get_compile_definitions_for_lang(ASM hrt_def)
  zephyr_get_include_directories_for_lang(ASM hrt_inc)
  zephyr_get_system_include_directories_for_lang(ASM hrt_sys)

  add_custom_target(asm_gen
    COMMAND ${CMAKE_C_COMPILER} ${hrt_opt} ${hrt_def} ${hrt_inc} ${hrt_sys} -S ${hrt_src}
    COMMENT ${hrt_msg}
    VERBATIM
  )
endfunction()

sdp_assembly_generate()
