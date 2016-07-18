SECTIONS {
	. = 0x80000000;

	.text : {
		*(.text)
		*(.rodata)
		*(.rodata1)
		. = ALIGN(4);
		*(.data)
		*(.data1)
		. = ALIGN(4);
		. = ALIGN(2048 * 1024);
	}
	.bss : {
		*(.bss)
		*(.bss1)
	}

	. = . + 0x20000000;
	.bss.uncached (NOLOAD) : {
		*(.bss.uncached)
	}

	/DISCARD/ : {
		*(.MIPS.abiflags)
		*(.reginfo)
		*(.gnu.attributes)
		*(.pdr)
		*(.comment)
	}

}

