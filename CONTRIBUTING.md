# Contributing to Terraform Module

Firstly, thank you for considering contributing! It's people like you that make the open-source community such a fantastic place to learn, inspire, and create. All contributions are welcome, including issues, new docs as well as updates and tweaks, blog posts, workshops, and more.

## Ways to Contribute
1. **Improve or update the documentation.**
2. **Report a bug.**
3. **Suggest a new feature or enhancement.**
4. **Contribute to the codebase.**

## Getting Started

1. **Clone Your Fork**: Clone the repository to your local machine.
   ```shell
   git clone https://github.com/arivictor/terraform-pagerduty-management
   cd terraform-pagerduty-management
   ```

2. **Create a Branch**: Create a new branch for your contribution.
   ```shell
   git checkout -b new-feature-branch
   ```

## Making Changes

1. **Make Changes**: Make your changes or additions to the codebase. Ensure your changes are well-commented and adhere to the project’s coding style.

2. **Test Your Changes**: Ensure that your changes do not break any functionality and add new tests if necessary.

3. **Update The Docs**: Use terraform-docs to update the documentation if you have made codebas changes.
    ```shell
    terraform-docs -c .terraform-docs-config.yml .
    ```

4. **Commit Your Changes**: Commit your changes using a descriptive commit message.
   ```shell
   git add .
   git commit -m "Added a new feature"
   ```

5. **Push Your Changes**: Push your changes to GitHub.
   ```shell
   git push origin new-feature-branch
   ```

## Submitting a Pull Request

1. **Create a Pull Request**: Navigate to Pull Requests on GitHub and click the "New pull request" button. Select your new branch and review your changes.

2. **Describe Your Changes**: Write a brief description of the changes you have made and explain the rationale behind them.

3. **Submit Your Pull Request**: Once you have reviewed your changes and written a description, click the "Create pull request" button.

## Code Review Process

1. **Review**: Maintainers will review your pull request, suggesting changes if necessary.

2. **Approval**: Once approved by a maintainer, your pull request will be merged.

3. **Communication**: Maintain an open line of communication with the maintainers throughout the process.

## Reporting Bugs or Suggesting Enhancements

Please use the [issue tracker](https://github.com/arivictor/terraform-pagerduty-management/issues) to report bugs or suggest enhancements.
