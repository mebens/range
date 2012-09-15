`range` is a function that allows you to imitate the concept of ranges in Lua using tables. The library is not final in any way, and I'm open suggestions on things to change.

## Example

``` lua
range = require("range")

-- numbers
range(1, 20) -- 1, 2, 3, 4, ..., 20
range(5, 9) -- 5, 6, 7, 8, 9
range(2, 10, 2) -- 2, 4, 6, 8, 10

-- characters
range("a", "z") -- "a", "b", "c", "d", ..., "z"
range("c", "f") -- "c", "d", "e", "f"
range("A", "G", 3) -- "A", "D", "G"
```

## `range(from, to, step)`

**from** Start of the range. Can be a number, string, or table.  
**to** End of the range. Has to the same type as `from`.  
**step** The gap between each element in the returned range.

The function returns a table containing all the elements in the specified range.

## Table Support

You can also use tables with the range, as long as the `__lt` and `__next` metamethods are implemented. `__next` is a custom metamethod used by `range`. Here's an example:

``` lua
local mt

function newObj(x)
  return setmetatable({ x = x }, mt)
end

mt = {
  __next = function(self, step)
    return newObj(self.x + step)
  end,
  
  __lt = function(self, other)
    return self.x < other.x
  end
}

range(newObj(0), newObj(10), 2)
```

You could use these facilities with your preferred object-orientation library.
