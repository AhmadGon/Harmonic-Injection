# Altera DE2-115 development and education board


# Timing Specification Constraints

create_clock -name CLKIN -period 20.000000ns -waveform {0.0ns 10.000000ns} [get_ports {CLKIN}]
derive_pll_clocks
derive_clock_uncertainty
