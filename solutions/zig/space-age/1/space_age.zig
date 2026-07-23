pub const Planet = enum {
    mercury,
    venus,
    earth,
    mars,
    jupiter,
    saturn,
    uranus,
    neptune,

    pub fn age(self: Planet, seconds: usize) f64 {
        const sec_f64: f64 = @as(f64, @floatFromInt(seconds));

        const earth_year_seconds: f64 = 31557600.0;

        const mul: f64 = switch (self) {
            .mercury => 0.2408467,
            .venus => 0.61519726,
            .earth => 1,
            .mars => 1.8808158,
            .jupiter => 11.862615,
            .saturn => 29.447498,
            .uranus => 84.016846,
            .neptune => 164.79132,
        };

        return (sec_f64 / earth_year_seconds) / mul;
    }
};
