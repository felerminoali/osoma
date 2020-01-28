package mz.co.osoma.validation;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.*;


@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy=EmailValidator.class)

public @interface EmailOrContactDuplication {

    String message() default "{Email.invalid}";

    Class<?>[] groups() default { };

    Class<? extends Payload>[] payload() default { };
}
