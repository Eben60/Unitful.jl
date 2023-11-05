# Units and сonstants pre-defined in the `Unitful` package

In the following, only non-prefixed units are listed. To get a more detailed information about a unit, and to get information about prefixed units, use `Julia` help, e.g.

```
help?> Unitful.kW
  Unitful.kW

  A prefixed unit, equal to 10^3 W.

  Dimension: 𝐋² 𝐌 𝐓⁻³

  See also: Unitful.W.
```

For prefixes, see [below](#Metric-(SI)-Prefixes).


## Basic dimensions 

### Amount

#### Mole 

```
Unitful.mol
```

The mole, the SI base unit for amount of substance. 

### Current

#### Ampere 

```
Unitful.A
```

The ampere, the SI base unit of electric current. 

### Length

#### Angstrom 

```
Unitful.angstrom
Unitful.Å
```

The angstrom, a metric unit of length defined as 1/10 nm. 

#### Foot 

```
Unitful.ft
```

The foot, a US customary unit of length defined as 12 inch. 

#### Inch 

```
Unitful.inch
```

The inch, a US customary unit of length defined as 2.54 cm. 

#### Meter 

```
Unitful.m
```

The meter, the SI base unit of length. 

#### Mile 

```
Unitful.mi
```

The mile, a US customary unit of length defined as 1760 yd. 

#### Mil 

```
Unitful.mil
```

The mil, a US customary unit of length defined as 1/1000 inch. 

#### Yard 

```
Unitful.yd
```

The yard, a US customary unit of length defined as 3 ft. 

#### Angstrom 

```
Unitful.angstrom
Unitful.Å
```

The angstrom, a metric unit of length defined as 1/10 nm. 

### Luminosity

#### Candela 

```
Unitful.cd
```

The candela, the SI base unit of luminous intensity. 

#### Lumen 

```
Unitful.lm
```

The lumen, an SI unit of luminous flux, defined as 1 cd × sr. 

### Mass

#### Dram 

```
Unitful.dr
```

The dram, a US customary unit of mass defined as 1/16 oz. 

#### Grain 

```
Unitful.gr
```

The grain, a US customary unit of mass defined as 1/7000 lb. 

#### Kilogram 

```
Unitful.kg
```

The kilogram, the SI base unit of mass. Note that `kg`, not `g`, is the base unit. 

#### Pound 

```
Unitful.lb
```

The pound-mass, a US customary unit of mass defined as exactly 0.453,592,37 kg. 

#### Ounce 

```
Unitful.oz
```

The ounce, a US customary unit of mass defined as 1/16 lb. 

#### Slug 

```
Unitful.slug
```

The slug, a US customary unit of mass defined as 1 lbf × s^2 / ft. 

#### UnifiedAtomicMassUnit 

```
Unitful.u
```

The unified atomic mass unit, or dalton, a unit of mass defined as 1/12 the mass of an unbound neutral atom of carbon-12, equal to 1.660,539,066,60 × 10^-27 kg (the CODATA 2018 recommended value). 

### Temperature

#### Kelvin 

```
Unitful.K
```

The kelvin, the SI base unit of thermodynamic temperature. 

#### Rankine 

```
Unitful.Ra
```

The rankine, a US customary unit of temperature defined as 5/9 K. 

#### Kelvin 

```
Unitful.°C
```

The degree Celsius, an SI unit of temperature, defined such that 0 °C = 273.15 K. 

#### Rankine 

```
Unitful.°F
```

The degree Fahrenheit, a US customary unit of temperature, defined such that 0 °F = 459.67 Ra. 

### Time

#### Day 

```
Unitful.d
```

The day, a unit of time defined as 24 hr. 

#### Hour 

```
Unitful.hr
```

The hour, a unit of time defined as 60 minutes. 

#### Minute 

```
Unitful.minute
```

The minute, a unit of time defined as 60 s. The full name `minute` is used instead of the symbol `min` to avoid confusion with the Julia function `min`. 

#### Second 

```
Unitful.s
```

The second, the SI base unit of time. 

#### Week 

```
Unitful.wk
```

The week, a unit of time, defined as 7 d. 

#### Year 

```
Unitful.yr
```

The year, a unit of time, defined as 365.25 d. 

## Compound dimensions 

### Acceleration

#### Gal 

```
Unitful.Gal
```

The gal, a CGS unit of acceleration, defined as 1 cm / s^2. 

#### EarthGravity 

```
Unitful.ge
```

The nominal acceleration due to gravity in a vacuum near the surface of the earth, a unit of acceleration, defined by standard to be exactly 9.806,65 m / s^2.

`Unitful.gn` is a quantity (with units `m/s^2`) whereas `Unitful.ge` is a unit equal to `gn`. 

### Area

#### Are 

```
Unitful.a
```

The are, a metric unit of area, defined as 100 m^2. 

#### Acre 

```
Unitful.ac
```

The acre, a US customary unit of area defined as 4840 yd^2. 

#### Barn 

```
Unitful.b
```

The barn, a metric unit of area, defined as 100 fm^2. 

#### Hectare 

```
Unitful.ha
```

The hectare, a metric unit of area, defined as 100 a. 

### BField

#### Gauss 

```
Unitful.Gauss
```

The gauss, a CGS unit of magnetic B-field strength, defined as 1 Mx / cm^2. 

#### Tesla 

```
Unitful.T
```

The tesla, an SI unit of magnetic B-field strength, defined as 1 kg / (A × s^2). 

### Capacitance

#### Farad 

```
Unitful.F
```

The farad, an SI unit of electrical capacitance, defined as 1 s^4 × A^2 / (kg × m^2). 

### Charge

#### Coulomb 

```
Unitful.C
```

The coulomb, an SI unit of electric charge, defined as 1 A × s. 

### DynamicViscosity

#### Poise 

```
Unitful.P
```

The poise, a CGS unit of dynamic viscosity, defined as 1 dyn × s / cm^2. 

### ElectricalConductance

#### Siemens 

```
Unitful.S
```

The siemens, an SI unit of electrical conductance, defined as 1 Ω^-1. 

### ElectricalResistance

#### Ohm 

```
Unitful.Ω
```

The ohm, an SI unit of electrical resistance, defined as 1 V / A. 

### Energy

#### BritishThermalUnit 

```
Unitful.btu
```

The British thermal unit, a US customary unit of heat defined by ISO 31-4 as exactly 1055.06 J. 

#### Calorie 

```
Unitful.cal
```

The calorie, a unit of energy defined as exactly 4.184 J. 

#### Erg 

```
Unitful.erg
```

The erg, a CGS unit of energy, defined as 1 dyn × cm. 

#### eV 

```
Unitful.eV
```

The electron-volt, a unit of energy, defined as q*V. 

#### Joule 

```
Unitful.J
```

The joule, an SI unit of energy, defined as 1 N × m. 

### Force

#### Dyne 

```
Unitful.dyn
```

The dyne, a CGS unit of force, defined as 1 g × cm / s^2. 

#### PoundsForce 

```
Unitful.lbf
```

The pound-force, a US customary unit of force defined as 1 lb × ge. 

#### Newton 

```
Unitful.N
```

The newton, an SI unit of force, defined as 1 kg × m / s^2. 

### Frequency

#### Becquerel 

```
Unitful.Bq
```

The becquerel, an SI unit of radioactivity, defined as 1 nuclear decay per s. 

#### Hertz 

```
Unitful.Hz
```

The hertz, an SI unit of frequency, defined as 1 s^-1. 

#### AngHertz 

```
Unitful.Hz2π
```

A unit for convenience in angular frequency, equal to 2π Hz. 

#### RevolutionsPerMinute 

```
Unitful.rpm
```

Revolutions per minute, a unit of rotational speed, defined as 2π rad / minute. 

#### RevolutionsPerSecond 

```
Unitful.rps
```

Revolutions per second, a unit of rotational speed, defined as 2π rad / s. 

### HField

#### Oersted 

```
Unitful.Oe
```

The oersted, a CGS unit of magnetic H-field strength, defined as 1000 A / (4π × m). 

### Inductance

#### Henry 

```
Unitful.H
```

The henry, an SI unit of electrical inductance, defined as 1 J / A^2. 

### KinematicViscosity

#### Stokes 

```
Unitful.St
```

The stokes, a CGS unit of kinematic viscosity, defined as 1 cm^2 / s. 

### MagneticFlux

#### Maxwell 

```
Unitful.Mx
```

The maxwell, a CGS unit of magnetic flux, defined as 1 Gauss × cm^2. 

#### Weber 

```
Unitful.Wb
```

The weber, an SI unit of magnetic flux, defined as 1 kg × m^2 / (A × s^2). 

### MolarFlow

#### Katal 

```
Unitful.kat
```

The katal, an SI unit of catalytic activity, defined as 1 mol of catalyzed substrate per s. 

### Molarity

#### Molar 

```
Unitful.M
```

A unit for measuring molar concentration, equal to 1 mol/L. 

### Power

#### Watt 

```
Unitful.W
```

The watt, an SI unit of power, defined as 1 J / s. 

### Pressure

#### Atmosphere 

```
Unitful.atm
```

The standard atmosphere, a unit of pressure, defined as 101,325 Pa. 

#### Barye 

```
Unitful.Ba
```

The barye, a CGS unit of pressure, defined as 1 dyn / cm^2. 

#### Bar 

```
Unitful.bar
```

The bar, a metric unit of pressure, defined as 100 kPa. 

#### Pascal 

```
Unitful.Pa
```

The pascal, an SI unit of pressure, defined as 1 N / m^2. 

#### PoundsPerSquareInch 

```
Unitful.psi
```

Pounds per square inch, a US customary unit of pressure defined as 1 lbf / inch^2. 

#### Torr 

```
Unitful.Torr
```

The torr, a unit of pressure, defined as 1/760 atm. 

### Velocity

#### SpeedOfLight 

```
Unitful.c
```

The speed of light in a vacuum, a unit of speed, defined as exactly 2.997,924,58 × 10^8 m/s.

`Unitful.c0` is a quantity (with units `m/s`) whereas `Unitful.c` is a unit equal to `c0`. 

### Voltage

#### Volt 

```
Unitful.V
```

The volt, an SI unit of electric potential, defined as 1 W / A. 

### Volume

#### Liter 

```
Unitful.L
Unitful.l
```

The liter, a metric unit of volume, defined as 1000 cm^3. 

## Metric (SI) Prefixes

| Prefix | Name | Power of Ten |
|--------|--------|--------|
| y | yocto | -24 | 
| z | zepto | -21 | 
| a | atto | -18 | 
| f | femto | -15 | 
| p | pico | -12 | 
| n | nano | -9 | 
| μ | micro | -6 | 
| m | milli | -3 | 
| c | centi | -2 | 
| d | deci | -1 | 
| da | deca | 1 | 
| h | hecto | 2 | 
| k | kilo | 3 | 
| M | mega | 6 | 
| G | giga | 9 | 
| T | tera | 12 | 
| P | peta | 15 | 
| E | exa | 18 | 
| Z | zetta | 21 | 
| Y | yotta | 24 | 

---------

and nothing more to tell you.
