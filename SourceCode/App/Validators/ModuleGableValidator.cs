﻿using FluentValidation;
using Microsoft.Extensions.Localization;
using ModulesRegistry.Data;
namespace ModulesRegistry.Validators
{
    public class ModuleGableValidator : AbstractValidator<ModuleGable>
    {
        public ModuleGableValidator(IStringLocalizer<App> localizer)
        {
            RuleFor(m => m.Label)
                .NotEmpty()
                .MinimumLength(1)
                .MaximumLength(20)
                .WithName(n => localizer["Direction"]);
            RuleFor(m => m.TypePropertyId)
                .MustBeSelected(localizer)
                .WithName(n => localizer["GableType"]);
        }
    }
}
