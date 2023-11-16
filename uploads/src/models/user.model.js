const { roles } = require('../config/roles');
const bcrypt = require('bcryptjs');
const { USER } = require("../constants/tables")

module.exports = (sequelize, DataTypes) => {
    const User = sequelize.define(
        USER,
        {
            id: {
                type: DataTypes.INTEGER(11).UNSIGNED,
                allowNull: false,
                primaryKey: true,
                autoIncrement: true,
                comment: 'Primary Key'
            },
            name: {
                type: DataTypes.STRING(50),
                allowNull: false,
                required: true
            },
            email: {
                type: DataTypes.STRING,
                required: true,
                allowNull: false,
            },
            password: {
                type: DataTypes.STRING,
                allowNull: false,
                required: true,
                trim: true,
                minlength: 8,
                validate(value) {
                    if (!value.match(/\d/) || !value.match(/[a-zA-Z]/)) {
                        throw new Error('Password must contain at least one letter and one number');
                    }
                },
                comment: 'Encrypted password'
            },
            roleName: {
                type: DataTypes.ENUM,
                values: roles,
                defaultValue: 'user',
                allowNull: false
            },
            userStatus: {
                type: DataTypes.ENUM,
                values: ["Active", "in-active"],
                defaultValue: 'Active',
                allowNull: false
            },
            isEmailVerified: {
                type: DataTypes.BOOLEAN,
                defaultValue: false,
                allowNull: false
            },
            createdBy: {
                type: DataTypes.INTEGER(11).UNSIGNED,
                allowNull: false,
                comment: 'Primary Key of "user_masters" table'
            },
            createdAt: {
                type: DataTypes.DATE(3),
                defaultValue: sequelize.literal('CURRENT_TIMESTAMP(3)')
            },
            updatedBy: {
                type: DataTypes.INTEGER(11).UNSIGNED,
                allowNull: true,
                comment: 'Primary Key of "user_masters" table'
            },
            updatedAt: {
                type: DataTypes.DATE(3),
                defaultValue: sequelize.literal('CURRENT_TIMESTAMP(3)')
            }
        },
        {
            timestamps: false,
            tableName: 'users',
            comment: 'Stores users data'
        });
    User.associate = function (models) {
    };

    User.beforeCreate(async (user) => {
        user.password = await bcrypt.hash(user.password, 8);
    });

    User.beforeUpdate(async (user) => {
        if (user.password) {
            user.password = await bcrypt.hash(user.password, 8);
        }
    });

    User.prototype.isPasswordMatch = async function (password) {
        const user = this;
        return bcrypt.compare(password, user.password);
    };
    User.prototype.toJSON = function () {
        var values = Object.assign({}, this.get());

        delete values.password;
        return values;
    }

    User.sync();
    return User;
};