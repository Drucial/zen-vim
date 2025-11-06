# Snacks.nvim Terminal Enhancement Contribution

## Overview

Potential contribution to [folke/snacks.nvim](https://github.com/folke/snacks.nvim) to enhance the terminal module with VSCode-style stacking management utilities.

## Current Implementation

Our implementation in `lua/utils/terminal.lua` provides:

### Core Features
- **True Terminal Stacking**: Only one terminal visible at a time (no splits)
- **Multi-terminal Management**: Create and manage multiple terminals in a stack
- **Smart Cycling**: Next/previous terminal with wrapping
- **Terminal Picker**: Select terminals by directory name
- **Panel Toggle**: Show/hide terminal panel with last active terminal restoration

### Key Functions
1. `get_valid_terminals()` - Filter valid terminal instances
2. `show_terminal(index)` - Display specific terminal, hiding others
3. `toggle_terminal_panel()` - Toggle visibility with smart show/hide
4. `create_new_terminal()` - Add new terminal to stack
5. `next_terminal()` / `prev_terminal()` - Cycle through terminals
6. `pick_terminal()` - Interactive picker showing directory names

### Technical Implementation
- Uses global state: `_G.terminal_stack` and `_G.terminal_current_index`
- Relies on `Snacks.terminal.get()` with unique `count` parameter for proper stacking
- Integrates with edgy.nvim for panel management
- Works across all modes (n, i, v, t)

## Why This Would Benefit Snacks.nvim

1. **Addresses Common Use Case**: Developers often need multiple terminals (dev server, logs, git, etc.)
2. **VSCode Familiarity**: Many users expect VSCode-style terminal behavior
3. **Minimal Addition**: ~190 lines of well-tested code
4. **Non-Breaking**: Would be opt-in enhancement to existing terminal module
5. **Already Proven**: Working implementation in production use

## Contribution Strategy

### Option 1: Enhance Existing Terminal Module
Add management utilities directly to `snacks.terminal`:
```lua
Snacks.terminal.stack = {
  create = function() ... end,
  toggle = function() ... end,
  next = function() ... end,
  prev = function() ... end,
  pick = function() ... end,
}
```

**Pros:**
- Integrates seamlessly with existing API
- Users get enhancement automatically
- Maintains single source of truth

**Cons:**
- Requires buy-in from maintainer on API design
- Need to match existing code style

### Option 2: New Terminal Manager Module
Create separate `snacks.terminal_manager` module:
```lua
require("snacks.terminal_manager").setup({
  win = { position = "right", width = 0.30 }
})
```

**Pros:**
- Cleaner separation of concerns
- Opt-in for users who want it
- Easier to review/merge

**Cons:**
- Additional module complexity
- May duplicate some logic

### Option 3: Example/Recipe in Docs
Contribute as documented pattern in snacks wiki/docs rather than code:
```lua
-- Recipe: VSCode-style Terminal Stacking
-- Add this to your config...
```

**Pros:**
- Lowest barrier to acceptance
- Users can customize easily
- Less maintenance

**Cons:**
- Less discoverable
- Users need to implement themselves

## Recommended Approach

**Start with Option 3, evolve to Option 1**

1. **Phase 1**: Open discussion issue on snacks repo
   - Present the use case and current implementation
   - Get feedback from maintainer on approach
   - Gauge community interest

2. **Phase 2**: Contribute as documentation/recipe
   - Add to snacks wiki or examples
   - Validate approach with community
   - Gather feedback on API design

3. **Phase 3**: If well-received, propose core integration
   - Refactor to match snacks architecture
   - Submit PR for terminal module enhancement
   - Work with maintainer on API refinement

## Before Contributing

### Code Preparation
- [ ] Review snacks.nvim codebase for code style patterns
- [ ] Refactor global state to use snacks' internal state management
- [ ] Add proper type annotations (snacks uses LuaLS annotations)
- [ ] Write tests (if snacks has test suite)
- [ ] Document all functions with snacks' doc format
- [ ] Remove edgy-specific logic (make it generic)

### Research
- [ ] Check existing issues for similar feature requests
- [ ] Review recent PRs to understand contribution guidelines
- [ ] Study how other snacks modules are structured
- [ ] Understand snacks.terminal internal architecture
- [ ] Check if folke has expressed opinions on terminal stacking

### Community
- [ ] Draft discussion issue explaining use case
- [ ] Prepare demo GIF/video showing functionality
- [ ] Create comparison with current snacks.terminal behavior
- [ ] List potential API design options for feedback

## Implementation Notes

### Key Insights from Our Implementation

1. **`Snacks.terminal.get()` vs `open()`**
   - Must use `get()` with unique `count` parameter
   - Ensures terminals stack properly instead of creating splits
   - This is crucial for true stacking behavior

2. **Window Validation**
   - Always check `term.win` exists before `nvim_win_is_valid()`
   - Prevents "Invalid window" errors

3. **Terminal Picker Enhancement**
   - Showing directory name (vs full path) is more user-friendly
   - Could be enhanced with process detection in future

4. **Global State Management**
   - Works for single config but snacks would need proper module state
   - Consider using snacks' state management patterns

### Potential API Design

```lua
-- Proposed snacks.terminal enhancement
Snacks.terminal.toggle({
  count = 1,  -- specific terminal number
  win = { position = "right", width = 0.30, stack = true }
})

-- New stack management API
Snacks.terminal.stack.toggle()  -- show/hide panel
Snacks.terminal.stack.create()  -- new terminal
Snacks.terminal.stack.next()    -- cycle forward
Snacks.terminal.stack.prev()    -- cycle backward
Snacks.terminal.stack.pick()    -- picker UI

-- Or simpler keybind-focused API
Snacks.terminal.cycle(1)   -- next
Snacks.terminal.cycle(-1)  -- previous
```

## Timeline

- **Research Phase**: 1-2 weeks
  - Study snacks codebase
  - Check community interest
  - Draft discussion issue

- **Initial Contribution**: 2-3 weeks
  - Refactor code to match snacks style
  - Prepare documentation
  - Submit issue/discussion

- **PR Development**: 1-2 months
  - Wait for maintainer feedback
  - Iterate on approach
  - Submit and refine PR

## Success Criteria

- [ ] Maintainer expresses interest in feature
- [ ] Community shows demand for enhancement
- [ ] PR merged into snacks.nvim
- [ ] Feature documented in snacks README
- [ ] Our config updated to use upstream implementation

## Alternative: Keep as Plugin

If contribution isn't accepted or takes too long:

**Plugin Name Ideas:**
- `terminal-stack.nvim`
- `vscode-terminal.nvim`
- `stacked-term.nvim`

**Would Include:**
- Current utils/terminal.lua as core
- Better terminal picker (with process detection)
- Multiple layout options (right, bottom, left)
- Session persistence
- Terminal naming/labeling

## References

- [snacks.nvim repo](https://github.com/folke/snacks.nvim)
- [snacks.terminal docs](https://github.com/folke/snacks.nvim#terminal)
- Our implementation: `lua/utils/terminal.lua`
- Our keybindings: `lua/config/keybinds.lua` (lines 118-150)

## Notes

- Folke is very responsive to well-thought-out contributions
- Snacks is designed to be a collection of small, useful utilities
- Terminal stacking fits the "snacks" philosophy perfectly
- VSCode-style behavior is a common request in the Neovim community

---

**Status**: Planning
**Last Updated**: 2025-01-06
**Owner**: @Drucial
