ENTRY(_start)

PHDRS {
    text PT_LOAD FLAGS(7);
}

SECTIONS
{
    . = _grub_text_base;
    .text : {
        _start = .;
        *(.text .text.*)
    } :text
    .rodata : {
        *(.rodata .rodata.*)
    } :text
    .module_license : {
        *(.module_license)
    } :text
    .data : {
        *(.data .data.*)
        . = ALIGN(0x10);
        _edata = .;
    } :text
    .bss : {
        __bss_start = .;
        *(.bss .bss.*)
        *(COMMON)
        . = ALIGN(0x10);
        _end = .;
    } :text
    /DISCARD/ : {
        *(.interp)
        *(.note*)
        *(.comment)
        *(.build-id)
    }
}
