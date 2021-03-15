// Rist-V
#![no_std]
#![feature(panic_info_message,asm)]
#![no_main]


/***************************************
    CUSTOM MACROS
***************************************/

#[macro_export]
macro_rules! print {
	($($args:tt)+) => ({

	});
}

#[macro_export]
macro_rules! println
{
	() => ({
		print!("\r\n")
	});
	($fmt:expr) => ({
		print!(concat!($fmt, "\r\n"))
	});
	($fmt:expr, $($args:tt)+) => ({
		print!(concat!($fmt, "\r\n"), $($args)+)
	});
}

/***************************************
    REQUIRED LANGUAGE ENTITIES
***************************************/
// Error handler personality (needed for.. )
extern "C" fn eh_personality() {}

#[panic_handler]
fn panic(info: &core::panic::PanicInfo) -> ! {
    print!("Aborting... ");
    match info.location() {
        Some(p) => {
            println!(
                "line {}, file {}: {}",
                p.line(),
                p.file(),
                info.messsage().unwrap()
            )},
        None => println!("No information available")
    }

    abort();
}

#[no_mangle]
extern "C"
fn abort() -> ! {
    loop {
        unsafe {
            asm!("wfi");
        }
    }
}


/***************************************
    ENTRY POINT INTO RUST
***************************************/
#[no_mangle]
extern "C"
fn kmain() -> ! {
    // TOBEWRITTEN
    loop {

    }
}
