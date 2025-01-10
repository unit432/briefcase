```ruby
it '' do
 # move page down for screenshot
 scroll_to(0, 100)
end
```

```ruby
it '' do
 # take a screenshot for entire window
 page.save_screenshot(full: true)
end
```
