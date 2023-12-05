fn main() -> felt252 {
    add(1, 2);
    fib(16);
    0
}

fn add(a: u256, b: u256) -> u256 {
    a + b
}

fn fib(mut n: felt252) -> felt252 {
    let mut a: felt252 = 0;
    let mut b: felt252 = 1;
    loop {
        if n == 0 {
            break a;
        }
        n = n - 1;
        let temp = b;
        b = a + b;
        a = temp;
    }
}

#[cfg(test)]
mod tests {
    use super::fib;
    use super::add;

    #[test]
    #[available_gas(100000)]
    fn test_add() {
        assert(add(2, 3) == 5, 'Result should be 5');
    }

    #[test]
    #[available_gas(100000)]
    fn test_fib() {
        assert(fib(16) == 987, 'Result should be 987');
    }
}
