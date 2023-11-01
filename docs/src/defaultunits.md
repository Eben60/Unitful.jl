# Units and Constants pre-defined in the `Unitful` package

Some explanations about units to follow. See example

```
help?> Unitful.eV

  Unitful.eV

  The electron-volt, a unit of energy, defined as q*V.

  Dimension: 𝐋^2 𝐌 𝐓^-2.

  See also: Unitful.q, Unitful.V.
```


## Basic dimensions 

### Amount

#### Mole 

```
Unitful.mol
```

The mole, the SI base unit for amount of substance.

Dimension: `Unitful.𝐍`.
 

### Current

#### Ampere 

```
Unitful.A
```

The ampere, the SI base unit of electric current.

Dimension: `Unitful.𝐈`.
 

### Length

#### Angstrom 

```
Unitful.angstrom
Unitful.Å
```

The angstrom, a metric unit of length defined as 1/10 nm.

Dimension: `Unitful.𝐋`.

See Also: `Unitful.nm`.
 

#### Foot 

```
Unitful.ft
```

The foot, a US customary unit of length defined as 12 inch.

Dimension: `Unitful.𝐋`.

See Also: `Unitful.inch`.
 

#### Inch 

```
Unitful.inch
```

The inch, a US customary unit of length defined as 2.54 cm.

Dimension: `Unitful.𝐋`.

See Also: `Unitful.cm`.
 

#### Meter 

```
Unitful.m
```

The meter, the SI base unit of length.

Dimension: `Unitful.𝐋`.
 

#### Mile 

```
Unitful.mi
```

The mile, a US customary unit of length defined as 1760 yd.

Dimension: `Unitful.𝐋`.

See Also: `Unitful.yd`.
 

#### Mil 

```
Unitful.mil
```

The mil, a US customary unit of length defined as 1/1000 inch.

Dimension: `Unitful.𝐋`.

See Also: `Unitful.inch`.
 

#### Yard 

```
Unitful.yd
```

The yard, a US customary unit of length defined as 3 ft.

Dimension: `Unitful.𝐋`.

See Also: `Unitful.ft`.
 

#### Angstrom 

```
Unitful.angstrom
Unitful.Å
```

The angstrom, a metric unit of length defined as 1/10 nm.

Dimension: `Unitful.𝐋`.

See Also: `Unitful.nm`.
 

### Luminosity

#### Candela 

```
Unitful.cd
```

The candela, the SI base unit of luminous intensity.

Dimension: `Unitful.𝐉`.
 

#### Lumen 

```
Unitful.lm
```

The lumen, an SI unit of luminous flux, defined as 1 cd × sr.

Dimension: `Unitful.𝐉`.

See also: `Unitful.cd`, `Unitful.sr`.
 

### Mass

#### Dram 

```
Unitful.dr
```

The dram, a US customary unit of mass defined as 1/16 oz.

Dimension: `Unitful.𝐌`.

See Also: `Unitful.oz`.
 

#### Grain 

```
Unitful.gr
```

The grain, a US customary unit of mass defined as 1/7000 lb.

Dimension: `Unitful.𝐌`.

See Also: `Unitful.lb`.
 

#### Gram 

```
Unitful.kg
```

The kilogram, the SI base unit of mass. Note that `kg`, not `g`, is the base unit.

Dimension: `Unitful.𝐌`.
 

#### Pound 

```
Unitful.lb
```

The pound-mass, a US customary unit of mass defined as exactly 0.453,592,37 kg.

Dimension: `Unitful.𝐌`.

See Also: `Unitful.kg`.
 

#### Ounce 

```
Unitful.oz
```

The ounce, a US customary unit of mass defined as 1/16 lb.

Dimension: `Unitful.𝐌`.

See Also: `Unitful.lb`.
 

#### Slug 

```
Unitful.slug
```

The slug, a US customary unit of mass defined as 1 lbf × s^2 / ft.

Dimension: `Unitful.𝐌`.

See Also: `Unitful.lbf`, `Unitful.s`, `Unitful.ft`.
 

#### UnifiedAtomicMassUnit 

```
Unitful.u
```

The unified atomic mass unit, or dalton, a unit of mass defined as 1/12 the mass of an unbound neutral atom of carbon-12, equal to 1.660,539,066,60 × 10^-27 kg (the CODATA 2018 recommended value).

Dimension: `Unitful.𝐌`.

See Also: `Unitful.kg`.
 

### Temperature

#### Kelvin 

```
Unitful.K
```

The kelvin, the SI base unit of thermodynamic temperature.

Dimension: `Unitful.𝚯`.
 

#### Rankine 

```
Unitful.Ra
```

The rankine, a US customary unit of temperature defined as 5/9 K.

Dimension: `Unitful.𝚯`.

See Also: `Unitful.K`.
 

#### Kelvin 

```
Unitful.°C
```

The degree Celsius, an SI unit of temperature, defined such that 0 °C = 273.15 K.

Dimension: `Unitful.𝚯`.

See also: `Unitful.K`.
 

#### Rankine 

```
Unitful.°F
```

The degree Fahrenheit, a US customary unit of temperature, defined such that 0 °F = 459.67 Ra.

Dimension: `Unitful.𝚯`.

See also: `Unitful.Ra`.
 

### Time

#### Day 

```
Unitful.d
```

The day, a unit of time defined as 24 hr.

Dimension: `Unitful.𝐓`.

See Also: `Unitful.hr`.
 

#### Hour 

```
Unitful.hr
```

The hour, a unit of time defined as 60 minutes.

Dimension: `Unitful.𝐓`.

See Also: `Unitful.minute`.
 

#### Minute 

```
Unitful.minute
```

The minute, a unit of time defined as 60 s. The full name `minute` is used instead of the symbol `min` to avoid confusion with the Julia function `min`.

Dimension: `Unitful.𝐓`.

See Also: `Unitful.s`.
 

#### Second 

```
Unitful.s
```

The second, the SI base unit of time.

Dimension: `Unitful.𝐓`.
 

#### Week 

```
Unitful.wk
```

The week, a unit of time, defined as 7 d.

Dimension: `Unitful.𝐓`.

See Also: `Unitful.d`.
 

#### Year 

```
Unitful.yr
```

The year, a unit of time, defined as 365.25 d.

Dimension: `Unitful.𝐓`.

See Also: `Unitful.hr`.
 

## Compound dimensions 

### Acceleration

#### Gal 

```
Unitful.Gal
```

The gal, a CGS unit of acceleration, defined as 1 cm / s^2.

Dimension: 𝐋 𝐓^-2.

See also: `Unitful.cm`, `Unitful.s`.
 

#### EarthGravity 

```
Unitful.ge
```

The nominal acceleration due to gravity in a vacuum near the surface of the earth, a unit of acceleration, defined by standard to be exactly 9.806,65 m / s^2.

`Unitful.gn` is a quantity (with units `m/s^2`) whereas `Unitful.ge` is a unit equal to `gn`.

Dimension: 𝐋 𝐓^-2.

See also: `Unitful.m`, `Unitful.s`.
 

### Area

#### Are 

```
Unitful.a
```

The are, a metric unit of area, defined as 100 m^2.

Dimension: 𝐋^2.

See Also: `Unitful.m`.
 

#### Acre 

```
Unitful.ac
```

The acre, a US customary unit of area defined as 4840 yd^2.

Dimension: 𝐋^2.

See Also: `Unitful.yd`.
 

#### Barn 

```
Unitful.b
```

The barn, a metric unit of area, defined as 100 fm^2.

Dimension: 𝐋^2.

See Also: `Unitful.fm`.
 

#### Are 

```
Unitful.ha
```

The hectare, a metric unit of area, defined as 100 a.

Dimension: 𝐋^2.

See Also: `Unitful.a`.
 

### BField

#### Gauss 

```
Unitful.Gauss
```

The gauss, a CGS unit of magnetic B-field strength, defined as 1 Mx / cm^2.

Dimension: 𝐌 𝐈^-1 𝐓^-2.

See also: `Unitful.cm`, `Unitful.Mx`
 

#### Tesla 

```
Unitful.T
```

The tesla, an SI unit of magnetic B-field strength, defined as 1 kg / (A × s^2).

Dimension: 𝐌 𝐈^-1 𝐓^-2.

See also: `Unitful.kg`, `Unitful.A`, `Unitful.s`.
 

### Capacitance

#### Farad 

```
Unitful.F
```

The farad, an SI unit of electrical capacitance, defined as 1 s^4 × A^2 / (kg × m^2).

Dimension: 𝐈^2 𝐓^4 𝐋^-2 𝐌^-1.

See also: `Unitful.s`, `Unitful.A`, `Unitful.kg`, `Unitful.m`.
 

### Charge

#### Coulomb 

```
Unitful.C
```

The coulomb, an SI unit of electric charge, defined as 1 A × s.

Dimension: 𝐈 𝐓.

See also: `Unitful.A`, `Unitful.s`.
 

### DynamicViscosity

#### Poise 

```
Unitful.P
```

The poise, a CGS unit of dynamic viscosity, defined as 1 dyn × s / cm^2.

Dimension: 𝐌 𝐋^-1 𝐓^-1.

See also: `Unitful.cm`, `Unitful.dyn`, `Unitful.s`
 

### ElectricalConductance

#### Siemens 

```
Unitful.S
```

The siemens, an SI unit of electrical conductance, defined as 1 Ω^-1.

Dimension: 𝐈^2 𝐓^3 𝐋^-2 𝐌^-1.

See also: `Unitful.Ω`
 

### ElectricalResistance

#### Ohm 

```
Unitful.Ω
```

The ohm, an SI unit of electrical resistance, defined as 1 V / A.

Dimension: 𝐋^2 𝐌 𝐈^-2 𝐓^-3.

See also: `Unitful.V`, `Unitful.A`.
 

### Energy

#### BritishThermalUnit 

```
Unitful.btu
```

The British thermal unit, a US customary unit of heat defined by ISO 31-4 as exactly 1055.06 J.

Dimension: 𝐋^2 𝐌 𝐓^-2.

See Also: `Unitful.J`.
 

#### Calorie 

```
Unitful.cal
```

The calorie, a unit of energy defined as exactly 4.184 J.

Dimension: 𝐋^2 𝐌 𝐓^-2.

See Also: `Unitful.J`.
 

#### Erg 

```
Unitful.erg
```

The erg, a CGS unit of energy, defined as 1 dyn × cm.

Dimension: 𝐋^2 𝐌 𝐓^-2.

See also: `Unitful.cm`, `Unitful.dyn`
 

#### eV 

```
Unitful.eV
```

The electron-volt, a unit of energy, defined as q*V.

Dimension: 𝐋^2 𝐌 𝐓^-2.

See also: `Unitful.q`, `Unitful.V`.
 

#### Joule 

```
Unitful.J
```

The joule, an SI unit of energy, defined as 1 N × m.

Dimension: 𝐋^2 𝐌 𝐓^-2.

See also: `Unitful.N`, `Unitful.m`.
 

### Force

#### Dyne 

```
Unitful.dyn
```

The dyne, a CGS unit of force, defined as 1 g × cm / s^2.

Dimension: 𝐋 𝐌 𝐓^-2.

See also: `Unitful.cm`, `Unitful.s`, `Unitful.g`.
 

#### PoundsForce 

```
Unitful.lbf
```

The pound-force, a US customary unit of force defined as 1 lb × ge.

Dimension: 𝐋 𝐌 𝐓^-2.

See Also: `Unitful.lb`, `Unitful.ge`.
 

#### Newton 

```
Unitful.N
```

The newton, an SI unit of force, defined as 1 kg × m / s^2.

Dimension: 𝐋 𝐌 𝐓^-2.

See also: `Unitful.kg`, `Unitful.m`, `Unitful.s`.
 

### Frequency

#### Becquerel 

```
Unitful.Bq
```

The becquerel, an SI unit of radioactivity, defined as 1 nuclear decay per s.

Dimension: 𝐓^-1.

See also: `Unitful.s`.
 

#### Hertz 

```
Unitful.Hz
```

The hertz, an SI unit of frequency, defined as 1 s^-1.

Dimension: 𝐓^-1.

See also: `Unitful.s`.
 

#### AngHertz 

```
Unitful.Hz2π
```

A unit for convenience in angular frequency, equal to 2π Hz.

Dimension: 𝐓^-1.

See also: `Unitful.Hz`.
 

#### RevolutionsPerMinute 

```
Unitful.rpm
```

Revolutions per minute, a unit of rotational speed, defined as 2π rad / minute.

Dimension: 𝐓^-1.

See Also: `Unitful.minute`, `Unitful.rad`.
 

#### RevolutionsPerSecond 

```
Unitful.rps
```

Revolutions per second, a unit of rotational speed, defined as 2π rad / s.

Dimension: 𝐓^-1.

See Also: `Unitful.rad`, `Unitful.s`.
 

### HField

#### Oersted 

```
Unitful.Oe
```

The oersted, a CGS unit of magnetic H-field strength, defined as 1000 A / (4π × m).

Dimension: 𝐈 𝐋^-1.

See also: `Unitful.A`, `Unitful.m`
 

### Inductance

#### Henry 

```
Unitful.H
```

The henry, an SI unit of electrical inductance, defined as 1 J / A^2.

Dimension: 𝐋^2 𝐌 𝐈^-2 𝐓^-2.

See also: `Unitful.J`, `Unitful.A`.
 

### KinematicViscosity

#### Stokes 

```
Unitful.St
```

The stokes, a CGS unit of kinematic viscosity, defined as 1 cm^2 / s.

Dimension: 𝐌^2 𝐓^-1.

See also: `Unitful.cm`, `Unitful.s`
 

### MagneticFlux

#### Maxwell 

```
Unitful.Mx
```

The maxwell, a CGS unit of magnetic flux, defined as 1 Gauss × cm^2.

Dimension: 𝐋^2 𝐌 𝐈^-1 𝐓^-2.

See also: `Unitful.cm`, `Unitful.Gauss`
 

#### Weber 

```
Unitful.Wb
```

The weber, an SI unit of magnetic flux, defined as 1 kg × m^2 / (A × s^2).

Dimension: 𝐋^2 𝐌 𝐈^-1 𝐓^-2.

See also: `Unitful.kg`, `Unitful.m`, `Unitful.A`, `Unitful.s`.
 

### MolarFlow

#### Katal 

```
Unitful.kat
```

The katal, an SI unit of catalytic activity, defined as 1 mol of catalyzed substrate per s.

Dimension: 𝐍 𝐓^-1.

See also: `Unitful.mol`, `Unitful.s`.
 

### Molarity

#### Molar 

```
Unitful.M
```

A unit for measuring molar concentration, equal to 1 mol/L.

Dimension: 𝐍 𝐋^-3.

See Also: `Unitful.L`, `Unitful.mol`.
 

### Power

#### Watt 

```
Unitful.W
```

The watt, an SI unit of power, defined as 1 J / s.

Dimension: 𝐋^2 𝐌 𝐓^-3.

See also: `Unitful.J`, `Unitful.s`.
 

### Pressure

#### Atmosphere 

```
Unitful.atm
```

The standard atmosphere, a unit of pressure, defined as 101,325 Pa.

Dimension: 𝐌 𝐋^-1 𝐓^-2.

See also: `Unitful.Pa`.
 

#### Barye 

```
Unitful.Ba
```

The barye, a CGS unit of pressure, defined as 1 dyn / cm^2.

Dimension: 𝐌 𝐋^-1 𝐓^-2.

See also: `Unitful.cm`, `Unitful.dyn`
 

#### Bar 

```
Unitful.bar
```

The bar, a metric unit of pressure, defined as 100 kPa.

Dimension: 𝐌 𝐋^-1 𝐓^-2.

See also: `Unitful.kPa`.
 

#### Pascal 

```
Unitful.Pa
```

The pascal, an SI unit of pressure, defined as 1 N / m^2.

Dimension: 𝐌 𝐋^-1 𝐓^-2.

See also: `Unitful.N`, `Unitful.m`.
 

#### PoundsPerSquareInch 

```
Unitful.psi
```

Pounds per square inch, a US customary unit of pressure defined as 1 lbf / inch^2.

Dimension: 𝐌 𝐋^-1 𝐓^-2.

See Also: `Unitful.lbf`, `Unitful.inch`.
 

#### Torr 

```
Unitful.Torr
```

The torr, a unit of pressure, defined as 1/760 atm.

Dimension: 𝐌 𝐋^-1 𝐓^-2.

See also: `Unitful.atm`.
 

### Velocity

#### SpeedOfLight 

```
Unitful.c
```

The speed of light in a vacuum, a unit of speed, defined as exactly 2.997,924,58 × 10^8 m/s.

`Unitful.c0` is a quantity (with units `m/s`) whereas `Unitful.c` is a unit equal to `c0`.

Dimension: 𝐋 𝐓^-1.

See also: `Unitful.m`, `Unitful.s`.
 

### Voltage

#### Volt 

```
Unitful.V
```

The volt, an SI unit of electric potential, defined as 1 W / A.

Dimension: 𝐋^2 𝐌 𝐈^-1 𝐓^-3.

See also: `Unitful.W`, `Unitful.A`
 

### Volume

#### Liter 

```
Unitful.L
Unitful.l
```

The liter, a metric unit of volume, defined as 1000 cm^3.

Dimension: 𝐋^3.

See Also: `Unitful.cm`.
 


---------

and nothing more to tell you.
