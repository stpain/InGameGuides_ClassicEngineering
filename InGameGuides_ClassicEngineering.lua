

local addonName, addon = ...;

local locales = {
    enUS = {
        FIREWORK_NOTE = "Make any of the fireworks until you reach 175."
    }
}

local locale = GetLocale()

local guide = {

    --this acts as the guide ID (as its a tradeskill use that ID) use guideID and some unique ID value
    skillLineID = 202,

    --expansion info (doesn't effect non retail clients)
    expansionSkillLineID = 2540,

    --guide name
    name = "Engineering",

    --guide type, this will inform IGG how to process the guide data
    type = "tradeskill",

    --target expansion
    expansion = "classic",

    --you can use the X-IGG fields in the .toc for this
    author = "",
    source = "",

    --guide template to use for the steps (the frames used in the IGG listview)
    --this can also be a function which wil be passed the step table so you can
    --return a template based on which step is being loaded
    --alternatively you can set a template in the step directly
    stepTemplate = "IGGStepTemplate",

    --this can be a fixed height or function returning a height
    --using a function will allow you to control if the step listview element is bigger to show space for the notes
    stepTemplateHeight = function(step)
        if type(step.craft.itemID) == "table" then
            return (67 + (#step.craft.itemID * 11))
        elseif step.craft.notes and step.craft.notes == "" then
            return 67;
        elseif step.craft.notes and #step.craft.notes > 0 then
            return 80;
        else
            return 67;
        end
    end,

    --provide a function to take your step data and apply it to the frame, if this is missing the IGG addon will check if the template
    --has a SetDataBinding() method and try calling that
    --[[

        IGG default :

        for k, step in ipairs(steps) do
            initializer = function(frame)
                if stepInitializerFunc then
                    stepInitializerFunc(frame, step)

                else
                    if frame.SetDataBinding then
                        frame:SetDataBinding(step)
                    end
                end
            end
        end

        in this example the IGG frame template has a method :SetDataBinding(data) which takes data from the step and applies it to frame labels/textures


        An example initializer:

        stepInitializerFunc = function(frame, step)

            frame.title:SetText(step.title)
            frame.icon:SetTexture(step.icon)

            frame:SetScript("OnMouseDown", function()
                print("Hello World!")
            end)
        end

        if you have your own frame template its probably wise to set your own stepInitializerFunc as you have complete control
        over the layout and logic
    ]]
    stepInitializerFunc = function(frame, step)
        if frame.SetDataBinding then
            frame:SetDataBinding(step)
        end
    end,

    --provide a function if you want to control when a step should be marked as completed
    --if no function is provided, currently the parent addon will use character profession 
    --skill level to make this determination
    stepCompletedFunc = function(step)

    end,


    --if the IGG addon finds a .materials key it'll show a button to toggle between the steps and the materials tables
    --both views are shown as a list and the materials list will also show/enable a button to load the items into
    --Auctionator so you can buy anything you need for the guide
    --this list is formatted at such
    --[[
        {
            { itemID, quantidy, },
        }
    ]]
    materials = {
        { 2835, 90, },
        { 2836, 20, },
        { 2838, 75, },
        { 7912, 100, },
        { 12365, 50, },
        { 4399, 10, },
        { 2880, 29, },
        { 4234, 50, },
        { 2592, 7, },
        { 4338, 10, },
        { 14047, 33, },
        { 2840, 50, },
        { 2842, 15, },
        { 2841, 55, },
        { 3575, 18, },
        { 3859, 4, },
        { 3860, 150, },
        { 12359, 159, },
    },

    --guide steps, this table will be what is used to populate the IGG listview
    --each entry is a 'step' in the guide and has its own listview entry
    --the below table format will work for the default IGG professions/tradeskills stepTemplates
    --if you are writing a guide for professions you can omit a lot of the above funcationality
    --and focus on this
    --other guides you will want to make sure your data here works with your frame templates
    steps = {
        {
            skillLevel = { 1, 40, },
            craft = {
                amount = 40,
                itemID = 4357,
                notes = "",
            },
        },
        {
            skillLevel = { 40, 50, },
            craft = {
                amount = 10,
                itemID = 4359,
                notes = "",
            },
        },
        {
            skillLevel = { 50, 51, },
            craft = {
                amount = 1,
                itemID = 6219,
                notes = "",
            },
        },
        {
            skillLevel = { 51, 65, },
            craft = {
                amount = 14,
                itemID = 4361,
                notes = "",
            },
        },
        {
            skillLevel = { 65, 75, },
            craft = {
                amount = 10,
                itemID = 4362,
                notes = "",
            },
        },
        {
            skillLevel = { 75, 95, },
            craft = {
                amount = 20,
                itemID = 4364,
                notes = "",
            },
        },
        {
            skillLevel = { 95, 105, },
            craft = {
                amount = 10,
                itemID = 4404,
                notes = "",
            },
        },
        {
            skillLevel = { 105, 125, },
            craft = {
                amount = 20,
                itemID = 4371,
                notes = "",
            },
        },
        {
            skillLevel = { 125, 135, },
            craft = {
                amount = 20,
                itemID = 4377,
                notes = "",
            },
        },
        {
            skillLevel = { 135, 145, },
            craft = {
                amount = 10,
                itemID = 4374,
                notes = "",
            },
        },
        {
            skillLevel = { 145, 150, },
            craft = {
                amount = 5,
                itemID = 4380,
                notes = "",
            },
        },
        {
            skillLevel = { 145, 150, },
            craft = {
                amount = 5,
                itemID = 4380,
                notes = "",
            },
        },
        {
            skillLevel = { 150, 175, },
            craft = {
                amount = 25,
                itemID = {9312, 9313, 9314},
                notes = locales[locale].FIREWORK_NOTE,
            },
        },
        {
            skillLevel = { 175, 176, },
            craft = {
                amount = 1,
                itemID = 10498,
            }
        },
        {
            skillLevel = { 176, 190, },
            craft = {
                amount = 15,
                itemID = 10505,
            }
        },
        {
            skillLevel = { 190, 195, },
            craft = {
                amount = 5,
                itemID = 4394,
            }
        },
        {
            skillLevel = { 195, 205, },
            craft = {
                amount = 10,
                itemID = 10559,
            }
        },
        {
            skillLevel = { 205, 210, },
            craft = {
                amount = 5,
                itemID = 10560,
            }
        },
        {
            skillLevel = { 210, 225, },
            craft = {
                amount = 15,
                itemID = 10512,
            }
        },
        {
            skillLevel = { 225, 235,},
            craft = {
                amount = 10,
                itemID = 10561,
            }
        },
        {
            skillLevel = { 235, 245,},
            craft = {
                amount = 10,
                itemID = 10562,
            }
        },
        {
            skillLevel = { 245, 250,},
            craft = {
                amount = 5,
                itemID = 10513,
            }
        },
        {
            skillLevel = { 250, 260,},
            craft = {
                amount = 10,
                itemID = 15992,
            }
        },
        {
            skillLevel = { 260, 290,},
            craft = {
                amount = 30,
                itemID = 15994,
            }
        },
        {
            skillLevel = { 290, 300,},
            craft = {
                amount = 10,
                itemID = 16000,
            }
        },
    }
}


--IGG will use the addon .toc to display this addon in the guides selection list
--when selected IGG will either look for this gudie and load it or it'll attempt to
--load this addon first
--the below code is required to let IGG know when this addon has loaded and pass the
--guide data to IGG
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" and (...) == addonName then
        if IGG and IGG.CallbackRegistry then
            IGG.CallbackRegistry:TriggerEvent("Guide_OnGuideLoaded", addonName, guide)
        end
    end
end)