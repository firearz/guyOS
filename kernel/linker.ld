ENTRY(start)

SECTIONS {
    . = 0x1000;
    .text : {
        *(.text)
    }
    .data : {
        *(.data)
    }
    .bss : {
        *(.bss COMMON)
    }
}
